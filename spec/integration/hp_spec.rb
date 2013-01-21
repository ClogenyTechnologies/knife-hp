# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# require File.expand_path(File.dirname(__FILE__) +'../../../utils/knifeutils')
# require File.expand_path(File.dirname(__FILE__) +'../../../utils/matchers')
# require File.expand_path(File.dirname(__FILE__) +'../../../spec_helper')
# require "securerandom"
require File.expand_path(File.dirname(__FILE__) + '/hp_factories')

require 'knife_cloud_tests'
require 'knife_cloud_tests/knifeutils'
require 'knife_cloud_tests/matchers'
#require File.expand_path(File.dirname(__FILE__) +'../../../spec_helper')
require "securerandom"

RSpec.configure do |config|
  FactoryGirl.find_definitions
end

# Method to prepare hp create server command

def prepare_create_srv_cmd_hp_cspec(server_create_factory)
  cmd = "#{cmds_hp.cmd_create_server} " +
      strip_out_command_key("#{server_create_factory.node_name}")  +
      " " + prepare_knife_command(server_create_factory)
  return cmd
end

def prepare_list_srv_cmd_hp_lspec(factory)
  cmd = "#{cmds_hp.cmd_list_server} " +
  prepare_knife_command(factory)
  return cmd
end

# Common method to run create server test cases

def run_hp_cspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised, run_list_cmd = true, run_del_cmd = true)
  context "" do
    instance_name = "instance_name"
    cmd_out = ""
    context "#{test_context}" do
      let(:server_create_factory){ FactoryGirl.build(factory_to_be_exercised) }
      # let(:instance_name){ strip_out_command_key("#{server_create_factory.node_name}") }
      let(:command) { prepare_create_srv_cmd_hp_cspec(server_create_factory) }
      after(:each){instance_name = strip_out_command_key("#{server_create_factory.node_name}")}
      context "#{test_case_scene}" do
        it "#{test_run_expect[:status]}" do
          match_status({:status => test_run_expect[:status]})
        end
      end
    end

    if run_list_cmd
      context "list server after #{test_context} " do
        let(:grep_cmd) { "| grep -e #{instance_name}" }
        let(:command) { prepare_list_srv_cmd_hp_lspec(srv_list_base_fact_hp)}
        after(:each){cmd_out = "#{cmd_stdout}"}
        it "should succeed" do
          match_status({:status => "should succeed"})
        end
      end
    end

    if run_del_cmd
      context "delete-purge server after #{test_context} #{test_case_scene}" do
        let(:command) { "#{cmds_hp.cmd_delete_server}" + " " +
                        find_id(instance_name, "#{cmd_out}") +
                        " " +
                        prepare_knife_command(srv_del_base_fact_hp) +
                        " -y" + " -N #{instance_name} -P"}
        it "should succeed" do
          match_status({:status => "should succeed"})
        end
      end
    end

  end
end

# Common method to run create server test cases

def run_hp_lspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:server_list_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_list_srv_cmd_hp_lspec(server_list_factory) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status({:status => test_run_expect})
      end
    end
  end
end

def create_srv_hp_dspec(server_create_factory)
  cmd = "#{cmds_hp.cmd_create_server} " +
  prepare_knife_command(server_create_factory)
  shell_out_command(cmd, "creating instance...")
end

def create_srvs_hp_dspec(count)
  for server_count in 0..count
    name_of_the_node = "hp-Node-#{SecureRandom.hex(4)}"
    tags_local       = "#{srv_create_params_fact_hp.tags} Name=" + name_of_the_node
    node_name_local  = "#{srv_create_params_fact_hp.node_name} " + name_of_the_node

    fact =  FactoryGirl.build(:hpServerCreateWithDefaults, node_name: node_name_local, tags: tags_local)
    instances.push fact
    create_srv_hp_dspec(fact)
  end
  return instances
end


def list_srv_hp_dspec()
  cmd = "#{cmds_hp.cmd_list_server} " +
  prepare_knife_command(srv_list_base_fact_hp)
  return shell_out_command(cmd, "listing instances...")
end

def find_inst_ids_hp_dspec(instances)
  instance_ids = []
  file = list_srv_hp_dspec.inspect
  puts "searching instance ids for instances created...."
  puts file
  instances.each do |instance|
    file.lines.each do |line|
      if line.include?(strip_out_command_key("#{instance.node_name}"))
        puts "#{line}"
        instance_ids.push "#{line}".split(' ').first
      end
    end
  end
  return instance_ids
end

# Method to prepare hp create server command

def prepare_del_srv_cmd_hp_dspec(factory, instances)
  cmd ="#{cmds_hp.cmd_delete_server}" + " " +
  "#{prepare_list_inst_ids_hp_dspec(instances)}" + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_del_srv_cmd_purge_hp_dspec(factory, instances)
  node_names = "-N"
  instances.each do |instance|
    node_names = node_names + " " + strip_out_command_key("#{instance.node_name}")
  end

  cmd ="#{cmds_hp.cmd_delete_server}" + " " +
  "#{prepare_list_inst_ids_hp_dspec(instances)}" + " " +  node_names + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_del_srv_cmd_non_exist_hp_dspec(factory)
  cmd ="#{cmds_hp.cmd_delete_server}" + " " +
  "1234567890" + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_list_inst_ids_hp_dspec(instances)
  instances_to_be_deleted = ""
  instance_ids = find_inst_ids_hp_dspec(instances)
  instance_ids.each do |instance|
    instances_to_be_deleted = instances_to_be_deleted + " " + "#{instance}"
  end
  return instances_to_be_deleted
end

# Common method to run create server test cases

def run_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised, test_case_type="")
  case test_case_type
      when "delete"
        srv_del_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      when "delete_multiple"
        srv_del_mult_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      when "delete_non_existent"
        srv_del_non_exist_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      else
  end
end

def srv_del_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:instances) { [] }
    before(:each) {create_srvs_hp_dspec(0)}
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_hp_dspec(server_delete_factory, instances) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end

def srv_del_mult_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:instances) { [] }
    before(:each) {create_srvs_hp_dspec(1)}
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_purge_hp_dspec(server_delete_factory, instances) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end

def srv_del_non_exist_hp_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_non_exist_hp_dspec(server_delete_factory) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end


describe 'knife hp' do
  include RSpec::KnifeUtils
  # before(:all) { load_factory_girl }
  before(:all) { load_knife_config }
  let(:cmds_hp){ FactoryGirl.build(:hpServerCommands) }
  let(:srv_del_base_fact_hp){FactoryGirl.build(:hpServerDeleteBase)}
  let(:srv_list_base_fact_hp){FactoryGirl.build(:hpServerListBase)}
  let(:srv_create_params_fact_hp){FactoryGirl.build(:hpServerCreateParameters)}

  expected_params = {
                     :status => "should succeed",
                     :stdout => nil,
                     :stderr => nil
                   }
  # Test Case: OP_KHP_1, CreateServerWithDefaults
  run_hp_cspec("server create", "with all default parameters", expected_params, :hpServerCreateWithDefaults)

  # Test Case: OP_KHP_2, CreateServerwithOneSecurityGroup
  run_hp_cspec("server create", "with security group parameter", expected_params, :hpServerCreateOneSecurityGroup)

  # Test Case: OP_KHP_3, CreateServerwithMultipleSecurityGroup
  run_hp_cspec("server create", "with multiple security group parameter", expected_params, :hpServerCreateMultipleSecurityGroup)

  # Test Case: OP_KHP_5, CreateServerwithExistingServerName
  run_hp_cspec("server create", "with existing server name", expected_params, :hpServerCreateWithExistingServerName)

  # Test Case: OP_KHP_6, CreateServerWithoutSecurityGroup
  run_hp_cspec("server create", "without security group", expected_params, :hpServerCreateWithoutSecurityGroup)

  # Test Case: OP_KHP_7, CreateServerInOtherAvailabilityZone
  run_hp_cspec("server create", "in other availability zone", expected_params, :hpServerCreateInOtherAvailabilityZone)

  # Test Case: OP_KHP_8, CreateServerOfDifferentFlavor
  run_hp_cspec("server create", "of different flavor", expected_params, :hpServerCreateOfDifferentFlavor)

  # Test Case: OP_KHP_20, CreateWindowsServerWithWinRMBasicAuth
  run_hp_cspec("windows server create", "wth win RM basic auth", expected_params, :hpWindowsServerCreateWithWinRMBasicAuth)

  # Test Case: OP_KHP_21, CreateWindowsServerWithSSHAuth
  run_hp_cspec("windows server create", "wth SSH auth", expected_params, :hpWindowsServerCreateWithSSHAuth)

  # Test Case: OP_KHP_17, CreateServerWithRoleAndRecipe
  run_hp_cspec("server create", "wth role and recipe", expected_params, :hpServerCreateWithRoleAndRecipe)

  # Test Case: OP_KHP_12, DeleteServerDontPurge
  run_hp_dspec("server delete", "woth no purge option", expected_params, :hpServerDeleteDontPurge, "delete")

  # Test Case: OP_KHP_15, DeleteMutipleServers
  run_hp_dspec("server delete", "command for multiple servers", expected_params, :hpServerDeleteMultiple, "delete_multiple")

  expected_params = {
                     :status => "should return empty list",
                     :stdout => nil,
                     :stderr => nil
                   }

  # Test Case: OP_KHP_13, ListServerEmpty
  run_hp_lspec("server list", "for no instances", expected_params, :hpServerListEmpty)


  expected_params = {
                     :status => "should fail",
                     :stdout => nil,
                     :stderr => nil
                   }
  # Test Case: OP_KHP_4, CreateServerWithWrongKeyCombination
  run_hp_cspec("server create", "with wrong key combination", expected_params, :hpServerCreateWrongKeyCombination, false, false)

  # Test Case: OP_KHP_9, CreateServerWithIncorrectSecurityGroup
  run_hp_cspec("server create", "with incorrect security group", expected_params, :hpServerCreateWithIncorrectSecurityGroup, false, false)

  # Test Case: OP_KHP_10, CreateServerInNonExistentZone
  run_hp_cspec("server create", "in non existent zone", expected_params, :hpServerCreateInNonExistentZone, false, false)

  # Test Case: OP_KHP_18, CreateServerwithInvalidRole
  # FIXME need to write a custom matcher to validate invalid role
  run_hp_cspec("server create", "wth invalid role", expected_params, :hpServerCreateWithInvalidRole)

  # Test Case: OP_KHP_19, CreateServerWithInvalidRecipe
  # FIXME need to write a custom matcher to validate invalid recipe
  run_hp_cspec("server create", "wth invalid recipe", expected_params, :hpServerCreateWithInvalidRecipe)

  # Test Case: OP_KHP_22, CreateLinuxServerWithWinRM
  run_hp_cspec("linux server create", "with win RM ", expected_params, :hpLinuxServerCreateWithWinRM)

  # Test Case: OP_KHP_15, DeleteServerThatDoesNotExist
  run_hp_dspec("server list", "woth non existent server", expected_params, :hpServerDeleteNonExistent, "delete_non_existent")
end
