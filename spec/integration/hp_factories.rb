# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

require  File.expand_path(File.dirname(__FILE__) +'/hp')
require "securerandom"

FactoryGirl.define do

  factory :hpServerCommands, class: HPKnifeServerCommands do
    cmd_list_flavor                   "knife hp flavor list"                     # Knife command for flavor list
    cmd_instance_data                 "knife hp instance data"                   # Knife command to get instance date
    cmd_create_server                 "knife hp server create"                   # Knife command for creating a server
    cmd_delete_server                 "knife hp server delete"                   # Knife command for deleting a server
    cmd_list_server                   "knife hp server list"                     # Knife command for listing servers
  end


  factory :hpServerCreateParameters, class: HPKnifeServerCreateParameters do
    bootstrap_proxy                   "--bootstrap-proxy"                       # The proxy server for the node being bootstrapped
    bootstrap_version                 "--bootstrap-version"                     #The version of Chef to install
    node_name                         "-N"                                      # The Chef node name for your new node
    node_name_l                       "--node-name"                             # The Chef node name for your new node
    server_url                        "-s"                                      # Chef Server URL
    server_url_l                      "--server-url"                            # Chef Server URL
    api_client_key                    "-k"                                      # API Client Key
    api_client_key_l                  "--key"                                   # API Client Key
    colored_optput                    "--[no-]color"                            # Use colored output, defaults to enabled
    config_file                       "-c"                                      # The configuration file to use
    defaults                          "--defaults"                              # Accept default values for all questions
    disable_editing                   "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    distro                            "-d"                                      # Bootstrap a distro using a template; default is 'chef-full'
    distro_l                          "--distro"                                # Bootstrap a distro using a template; default is 'chef-full'
    editor                            "-e"                                      # Set the editor to use for interactive commands
    editor_l                          "--editor"                                # Set the editor to use for interactive commands
    environment                       "-E"                                      # Set the Chef environment
    environment_l                     "--environment"                           # Set the Chef environment
    flavor                            "-f"                                      # The flavor of server
    flavor_l                          "--flavor"                                # The flavor of server
    format                            "-F"                                      # Which format to use for output
    format_l                          "--format"                                # Which format to use for output
    host_key                          "--[no-]host-key-verify"                  # Verify host key, enabled by default.
    account_id                        "-A"                                      # Your HP Cloud Access Key ID
    account_id_l                      "--hp-account"                            # Your HP Cloud Access Key ID
    auth_uri                          "--hp-auth"                               # Your HP Cloud Auth URI
    availability_zone                 "-Z"                                      # Your HP Cloud Availability Zone
    availability_zone_l               "--hp-zone"                               # Your HP Cloud Availability Zone
    secret_key                        "-K"                                      # Your HP Cloud Secret Key
    secret_key_l                      "--hp-secret"                             # Your HP Cloud Secret Key
    tenant                            "-T"                                      # Your HP Cloud Tenant ID
    tenant_l                          "--hp-tenant"                             # Your HP Cloud Tenant ID
    identity_file                     "-i"                                      # The SSH identity file used for authentication
    identity_file_l                   "--identity-file"                         # The SSH identity file used for authentication
    image                             "-I"                                      # The HP Cloud Install Image ID for the server
    image_l                           "--image"                                 # The HP Cloud Install Image ID for the server
    user                              "-u"                                      # API Client Username
    user_l                            "--user"                                  # API Client Username
    pre_release                       "--prerelease"                            # Install the pre-release chef gems
    print_after                       "--print-after"                           # Show the data after a destructive operation
    run_list                          "-r"                                      # Comma separated list of roles/recipes to apply
    run_list_l                        "--run-list"                              # Comma separated list of roles/recipes to apply
    security_groups                   "-G"                                      # The HP Cloud Security Group(s) for this server
    security_groups_l                 "--groups"                                # The HP Cloud Security Group(s) for this server
    ssh_key_id                        "-S"                                      # The HP Cloud Key Pair ID
    ssh_key_id_l                      "--ssh-key"                               # The HP Cloud Key Pair ID
    ssh_password                      "-P"                                      # The ssh password
    ssh_password_l                    "--ssh-password"                          # The ssh password
    ssh_username                      "-x"                                      # The ssh username
    ssh_username_l                    "--ssh-user"                              # The ssh username
    template_file                     "--template-file"                         # Full path to location of template to use
    verbose                           "-V"                                      # More verbose output. Use twice for max verbosity
    verbose_l                         "--verbose"                               # More verbose output. Use twice for max verbosity
    version_chef                      "-v"                                      # Show chef version
    version_chef_l                    "--version"                               # Show chef version
    say_yes_to_all_prompts            "-y"                                      # Say yes to all prompts for confirmation
    say_yes_to_all_prompts_l          "--yes"                                   # Say yes to all prompts for confirmation
    help                              "-h"                                      # Show help
    help_l                            "--help"                                  # Show help
  end

  factory :hpServerDeleteParameters, class:  HPKnifeServerDeleteParameters do
    node_name                         "-N"                                      # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    node_name_l                       "--node-name"                             # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    server_url                        "-s"                                      # Chef Server URL
    server_url_l                      "--server-url"                            # Chef Server URL
    api_client_key                    "-k"                                      # API Client Key
    api_client_key_l                  "--key"                                   # API Client Key
    colored_optput                    "--[no-]color"                            # Use colored output, defaults to enabled
    config_file                       "-c"                                      # The configuration file to use
    defaults                          "--defaults"                              # Accept default values for all questions
    disable_editing                   "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    editor                            "-e"                                      # Set the editor to use for interactive commands
    editor_l                          "--editor"                                # Set the editor to use for interactive commands
    environment                       "-E"                                      # Set the Chef environment
    environment_l                     "--environment"                           # Set the Chef environment
    format                            "-F"                                      # Which format to use for output
    format_l                          "--format"                                # Which format to use for output
    account_id                        "-A"                                      # Your HP Cloud Access Key ID
    account_id_l                      "--hp-account"                            # Your HP Cloud Access Key ID
    auth_uri                          "--hp-auth"                               # Your HP Cloud Auth URI
    availability_zone                 "-Z"                                      # Your HP Cloud Availability Zone (az1/az2)
    availability_zone_l               "--hp-zone"                               # Your HP Cloud Availability Zone (az1/az2)
    secret_key                        "-K"                                      # Your HP Cloud Secret Key
    secret_key_l                      "--hp-secret"                             # Your HP Cloud Secret Key
    tenant                            "-T"                                      # Your HP Cloud Tenant ID
    tenant_l                          "--hp-tenant"                             # Your HP Cloud Tenant ID
    user                              "-u"                                      # API Client Username
    user_l                            "--user"                                  # API Client Username
    print_after                       "--print-after"                           # Show the data after a destructive operation
    purge                             "-P"                                      # Destroy corresponding node and client on the Chef Server, in addition to destroying the hp node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    purge_l                           "--purge"                                 # Destroy corresponding node and client on the Chef Server, in addition to destroying the hp node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    verbose                           "-V"                                      # More verbose output. Use twice for max verbosity
    verbose_l                         "--verbose"                               # More verbose output. Use twice for max verbosity
    version_chef                      "-v"                                      # Show chef version
    version_chef_l                    "--version"                               # Show chef version
    say_yes_to_all_prompts            "-y"                                      # Say yes to all prompts for confirmation
    say_yes_to_all_prompts_l          "--yes"                                   # Say yes to all prompts for confirmation
    help                              "-h"                                      # Show help
    help_l                            "--help"                                  # Show help
  end

  factory :hpServerListParameters, class:  HPKnifeServerListParameters do
    server_url                       "-s"                                      # Chef Server URL
    server_url_l                     "--server-url"                            # Chef Server URL
    api_client_key                   "-k"                                      # API Client Key
    api_client_key_l                 "--key"                                   # API Client Key
    colored_optput                   "--[no-]color"                            # Use colored output, defaults to enabled
    config_file                      "-c"                                      # The configuration file to use
    config_file_l                    "--config"                                # The configuration file to use
    defaults                         "--defaults"                              # Accept default values for all questions
    disable_editing                  "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    editor                           "-e"                                      # Set the editor to use for interactive commands
    editor_l                         "--editor"                                # Set the editor to use for interactive commands
    environment                      "-E"                                      # Set the Chef environment
    environment_l                    "--environment"                           # Set the Chef environment
    format                           "-F"                                      # Which format to use for output
    format_l                         "--format"                                # Which format to use for output
    account_id                       "-A"                                      # Your HP Cloud Access Key ID
    account_id_l                     "--hp-account"                            # Your HP Cloud Access Key ID
    auth_uri                         "--hp-auth"                               # Your HP Cloud Auth URI
    availability_zone                "-Z"                                      # Your HP Cloud Availability Zone (az1/az2)
    availability_zone_l              "--hp-zone"                               # Your HP Cloud Availability Zone (az1/az2)
    secret_key                       "-K"                                      # Your HP Cloud Secret Key
    secret_key_l                     "--hp-secret"                             # Your HP Cloud Secret Key
    tenant                           "-T"                                      # Your HP Cloud Tenant ID
    tenant_l                         "--hp-tenant"                             # Your HP Cloud Tenant ID
    user                             "-u"                                      # API Client Username
    user_l                           "--user"                                  # API Client Username
    print_after                      "--print-after"                           # Show the data after a destructive operation
    region                           "--region"                                # Your AWS region
    tags                             "-t"                                      # List of tags to output
    tags_l                           "--tags"                                  # List of tags to output
    verbose                          "-V"                                      # More verbose output. Use twice for max verbosity
    verbose_l                        "--verbose"                               # More verbose output. Use twice for max verbosity
    version_chef                     "-v"                                      # Show chef version
    version_chef_l                   "--version"                               # Show chef version
    say_yes_to_all_prompts           "-y"                                      # Say yes to all prompts for confirmation
    say_yes_to_all_prompts_l         "--yes"                                   # Say yes to all prompts for confirmation
    help                             "-h"                                      # Show help
    help_l                           "--help"                                  # Show help
  end

  hp_server_create_params_factory = FactoryGirl.build(:hpServerCreateParameters)
  hp_server_delete_params_factory = FactoryGirl.build(:hpServerDeleteParameters)
  hp_server_list_params_factory = FactoryGirl.build(:hpServerListParameters)
  model_obj_server_create = HPKnifeServerCreateParameters.new

  properties_file = File.expand_path(File.dirname(__FILE__) + "/properties/credentials.yml")
  properties = File.open(properties_file) { |yf| YAML::load(yf) }
  valid_bl_username = properties["credentials"]["username"]
  valid_bl_password = properties["credentials"]["password"]
  valid_account_id = properties["credentials"]["account_id"]
  valid_secret_key = properties["credentials"]["secret_key"]
  valid_tenant_id  = properties["credentials"]["tenant_id"]
  ssh_key_name = properties["credentials"]["ssh_key_file_name"]
  ssh_key_data = properties["credentials"]["ssh_key_file_data"]
  # Base Factory create server
  # Note: for HP Images and KeyPairs are specific to the availability zones
  factory :hpServerCreateBase, class: HPKnifeServerCreateParameters do
    name_of_the_node =    "hp-Node-#{SecureRandom.hex(4)}"
    identity_file         "#{hp_server_create_params_factory.identity_file} "       + model_obj_server_create.create_user_ssh_key_path(ssh_key_name, ssh_key_data)
    ssh_key_id            "#{hp_server_create_params_factory.ssh_key_id} "          + ssh_key_name
    image                 "#{hp_server_create_params_factory.image} "               + "120"     # Ubuntu image
    account_id            "#{hp_server_create_params_factory.account_id} "          + "#{valid_account_id}"
    secret_key            "#{hp_server_create_params_factory.secret_key} "          + "#{valid_secret_key}"
    tenant                "#{hp_server_create_params_factory.tenant} "              + "#{valid_tenant_id}"
    flavor                "#{hp_server_create_params_factory.flavor} "              + "100" # Size equivalient to t.micro in ec2
    node_name             "#{hp_server_create_params_factory.node_name} "           + name_of_the_node
    ssh_username          "#{hp_server_create_params_factory.ssh_username} "        + "ubuntu"
    # availability_zone     "#{hp_server_create_params_factory.availability_zone} "   + "az2"
  end

  # Base Factory for delete server
  factory :hpServerDeleteBase, class: HPKnifeServerDeleteParameters do
    account_id            "#{hp_server_create_params_factory.account_id} "    + "#{valid_account_id}"
    secret_key            "#{hp_server_create_params_factory.secret_key} "    + "#{valid_secret_key}"
    tenant                "#{hp_server_create_params_factory.tenant} "        + "#{valid_tenant_id}"
  end

  # Base Factory for list server
  factory :hpServerListBase, class: HPKnifeServerListParameters do
    account_id            "#{hp_server_create_params_factory.account_id} "    + "#{valid_account_id}"
    secret_key            "#{hp_server_create_params_factory.secret_key} "    + "#{valid_secret_key}"
    tenant                "#{hp_server_create_params_factory.tenant} "        + "#{valid_tenant_id}"
  end

  # Test Case: OP_KEP_1, CreateServerWithDefaults
  factory :hpServerCreateWithDefaults, parent: :hpServerCreateBase do
    name_of_the_node =    "hp-Node-#{SecureRandom.hex(4)}"
    node_name             "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_2, CreateServerwithOneSecurityGroup
  factory :hpServerCreateOneSecurityGroup, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{hp_server_create_params_factory.security_groups} " + "default"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_3, CreateServerwithMultipleSecurityGroup
  factory :hpServerCreateMultipleSecurityGroup, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{hp_server_create_params_factory.security_groups} " + "default1, default2, default3"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_4, CreateServerWithWrongKeyCombination
  factory :hpServerCreateWrongKeyCombination, parent: :hpServerCreateBase do
    name_of_the_node =    "hp-Node-#{SecureRandom.hex(4)}"
    ssh_key_id            "#{hp_server_create_params_factory.ssh_key_id} " + "its_a_wrong_key.pem"
    node_name             "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_5, CreateServerwithExistingServerName
  factory :hpServerCreateWithExistingServerName, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_6, CreateServerWithoutSecurityGroup
  factory :hpServerCreateWithoutSecurityGroup, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_7, CreateServerInOtherAvailabilityZone
  factory :hpServerCreateInOtherAvailabilityZone, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    availability_zone   "#{hp_server_create_params_factory.availability_zone} " + "us-east-1d"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_8, CreateServerOfDifferentFlavor
  factory :hpServerCreateOfDifferentFlavor, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-m1-small-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
    image               "#{hp_server_create_params_factory.image} " + "34971"
    flavor              "#{hp_server_create_params_factory.flavor} " + "101"    # Size equivalient to t.small in ec2
  end

  # Test Case: OP_KEP_9, CreateServerWithIncorrectSecurityGroup
  factory :hpServerCreateWithIncorrectSecurityGroup, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{hp_server_create_params_factory.security_groups} " + "InvalidSecurityGroup"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_10, CreateServerInNonExistentZone
  factory :hpServerCreateInNonExistentZone, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    availability_zone   "#{hp_server_create_params_factory.availability_zone} " + "NonExistentZone"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KHP_11, DeleteServerPurge
  factory :hpServerDeletePurge, parent: :hpServerDeleteBase do
    purge              "#{hp_server_delete_params_factory.purge}"
  end

  # Test Case: OP_KHP_12, DeleteServerDontPurge
  factory :hpServerDeleteDontPurge, parent: :hpServerDeleteBase do
  end

  # Test Case: OP_KHP_13, ListServerEmpty
  factory :hpServerListEmpty, parent: :hpServerListBase do
  end

  # Test Case: OP_KHP_14, ListServerNonEmpty
  factory :hpServerListNonEmpty, parent: :hpServerListBase do
  end

  # Test Case: OP_KHP_15, DeleteMutipleServers
  factory :hpServerDeleteMultiple, parent: :hpServerDeleteBase do
    purge              "#{hp_server_delete_params_factory.purge}"
  end

  # Test Case: OP_KHP_16, DeleteServerThatDoesNotExist
  factory :hpServerDeleteNonExistent, parent: :hpServerDeleteBase do
    node_name           "#{hp_server_create_params_factory.node_name} " + "nonextistentsrv"
  end

  # Test Case: OP_KHP_17, CreateServerWithRoleAndRecipe
  factory :hpServerCreateWithRoleAndRecipe, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{hp_server_create_params_factory.run_list} "  + "recipe[build-essential], role[webserver]"
  end

  # Test Case: OP_KHP_18, CreateServerwithInvalidRole
  factory :hpServerCreateWithInvalidRole, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{hp_server_create_params_factory.run_list} "  + "recipe[build-essential], role[invalid-role]"
  end

  # Test Case: OP_KHP_19, CreateServerWithInvalidRecipe
  factory :hpServerCreateWithInvalidRecipe, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{hp_server_create_params_factory.run_list} "  + "recipe[invalid-recipe]"
  end

  # Test Case: OP_KHP_20, CreateWindowsServerWithWinRMBasicAuth
  factory :hpWindowsServerCreateWithWinRMBasicAuth, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Win-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} "  + name_of_the_node
    image               "#{hp_server_create_params_factory.image} "      + "34971"
    flavor              "#{hp_server_create_params_factory.flavor} "     + "100"    # Size equivalient to t.micro in ec2
  end

  # Test Case: OP_KHP_21, CreateWindowsServerWithSSHAuth
  factory :hpWindowsServerCreateWithSSHAuth, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} "        + name_of_the_node
    image               "#{hp_server_create_params_factory.image} "            + "34971"    # Windows image
    flavor              "#{hp_server_create_params_factory.flavor} "           + "100"      # Size equivalient to t.micro in ec2
    ssh_username        "#{hp_server_create_params_factory.ssh_username} "     + "ubuntu"
    ssh_password        "#{hp_server_create_params_factory.ssh_password} "     + "ssh!Passw0rd"
  end

  # Test Case: OP_KHP_22, CreateLinuxServerWithWinRM
  factory :hpLinuxServerCreateWithWinRM, parent: :hpServerCreateBase do
    name_of_the_node =  "hp-Node-#{SecureRandom.hex(4)}"
    node_name           "#{hp_server_create_params_factory.node_name} "        + name_of_the_node
  end
end
