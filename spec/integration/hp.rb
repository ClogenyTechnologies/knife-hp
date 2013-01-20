require 'knife_cloud_tests'

class HPKnifeServerCommands
    attr_accessor :cmd_list_flavor                   # "knife hp flavor list"                     # Knife command for flavor list
    attr_accessor :cmd_instance_data                 # "knife hp instance data"                   # Knife command to get instance date
    attr_accessor :cmd_create_server                 # "knife hp server create"                   # Knife command for creating a server
    attr_accessor :cmd_delete_server                 # "knife hp server delete"                   # Knife command for deleting a server
    attr_accessor :cmd_list_server                   # "knife hp server list"                     # Knife command for listing servers
end

class HPKnifeServerCreateParameters
    attr_accessor :bootstrap_proxy                   # "--bootstrap-proxy"                       # The proxy server for the node being bootstrapped
    attr_accessor :bootstrap_version                 # "--bootstrap-version"                     #The version of Chef to install
    attr_accessor :node_name                         # "-N"                                      # The Chef node name for your new node
    attr_accessor :node_name_l                       # "--node-name"                             # The Chef node name for your new node
    attr_accessor :server_url                        # "-s"                                      # Chef Server URL
    attr_accessor :server_url_l                      # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                    # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                  # "--key"                                   # API Client Key
    attr_accessor :colored_optput                    # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                       # "-c"                                      # The configuration file to use
    attr_accessor :defaults                          # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                   # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :distro                            # "-d"                                      # Bootstrap a distro using a template; default is 'chef-full'
    attr_accessor :distro_l                          # "--distro"                                # Bootstrap a distro using a template; default is 'chef-full'
    attr_accessor :editor                            # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                          # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                       # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                     # "--environment"                           # Set the Chef environment
    attr_accessor :flavor                            # "-f"                                      # The flavor of server (m1.small, m1.medium,etc)
    attr_accessor :flavor_l                          # "--flavor"                                # The flavor of server (m1.small, m1.medium,etc)
    attr_accessor :format                            # "-F"                                      # Which format to use for output
    attr_accessor :format_l                          # "--format"                                # Which format to use for output
    attr_accessor :host_key                          # "--[no-]host-key-verify"                  # Verify host key, enabled by default.
    attr_accessor :account_id                        # "-A"                                      # Your HP Cloud Access Key ID
    attr_accessor :account_id_l                      # "--hp-account"                            # Your HP Cloud Access Key ID
    attr_accessor :auth_uri                          # "--hp-auth"                               # Your HP Cloud Auth URI
    attr_accessor :availability_zone                  # "-Z"                                      # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :availability_zone_l               # "--hp-zone"                               # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :secret_key                        # "-K"                                      # Your HP Cloud Secret Key
    attr_accessor :secret_key_l                      # "--hp-secret"                             # Your HP Cloud Secret Key
    attr_accessor :tenant                            # "-T"                                      # Your HP Cloud Tenant ID
    attr_accessor :tenant_l                          # "--hp-tenant"                             # Your HP Cloud Tenant ID
    attr_accessor :identity_file                     # "-i"                                      # The SSH identity file used for authentication
    attr_accessor :identity_file_l                   # "--identity-file"                         # The SSH identity file used for authentication
    attr_accessor :image                             # "-I"                                      # The HP Cloud Install Image ID for the server
    attr_accessor :image_l                           # "--image"                                 # The HP Cloud Install Image ID for the server
    attr_accessor :user                              # "-u"                                      # API Client Username
    attr_accessor :user_l                            # "--user"                                  # API Client Username
    attr_accessor :pre_release                       # "--prerelease"                            # Install the pre-release chef gems
    attr_accessor :print_after                       # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :run_list                          # "-r"                                      # Comma separated list of roles/recipes to apply
    attr_accessor :run_list_l                        # "--run-list"                              # Comma separated list of roles/recipes to apply
    attr_accessor :security_groups                   # "-G"                                      # The HP Cloud Security Group(s) for this server
    attr_accessor :security_groups_l                 # "--groups"                                # The HP Cloud Security Group(s) for this server
    attr_accessor :ssh_key_id                        # "-S"                                      # The HP Cloud Key Pair ID
    attr_accessor :ssh_key_id_l                      # "--ssh-key"                               # The HP Cloud Key Pair ID
    attr_accessor :ssh_password                      # "-P"                                      # The ssh password
    attr_accessor :ssh_password_l                    # "--ssh-password"                          # The ssh password
    attr_accessor :ssh_username                      # "-x"                                      # The ssh username
    attr_accessor :ssh_username_l                    # "--ssh-user"                              # The ssh username
    attr_accessor :template_file                     # "--template-file"                         # Full path to location of template to use
    attr_accessor :verbose                           # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                         # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                      # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                    # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts            # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l          # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                              # "-h"                                      # Show help
    attr_accessor :help_l                            # "--help"                                  # Show help

    def user_ssh_dir
      @_user_ssh_dir ||= Dir.mktmpdir
    end

    def user_ssh_pem_path(filename)
        "#{user_ssh_dir}/#{filename}.pem"
    end

    def  create_user_ssh_key_path(filename, data)
      pem_file_path = user_ssh_pem_path(filename)
      File.open(pem_file_path, 'w') {|f| f.write(data)}
      puts "Creating user hp ssh key file at:#{pem_file_path}"
      return pem_file_path
    end
end


class HPKnifeServerDeleteParameters
    attr_accessor :node_name                         # "-N"                                      # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    attr_accessor :node_name_l                       # "--node-name"                             # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    attr_accessor :server_url                        # "-s"                                      # Chef Server URL
    attr_accessor :server_url_l                      # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                    # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                  # "--key"                                   # API Client Key
    attr_accessor :colored_optput                    # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                       # "-c"                                      # The configuration file to use
    attr_accessor :defaults                          # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                   # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :editor                            # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                          # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                       # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                     # "--environment"                           # Set the Chef environment
    attr_accessor :format                            # "-F"                                      # Which format to use for output
    attr_accessor :format_l                          # "--format"                                # Which format to use for output
    attr_accessor :account_id                        # "-A"                                      # Your HP Cloud Access Key ID
    attr_accessor :account_id_l                      # "--hp-account"                            # Your HP Cloud Access Key ID
    attr_accessor :auth_uri                          # "--hp-auth"                               # Your HP Cloud Auth URI
    attr_accessor :availability_zone                 # "-Z"                                      # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :availability_zone_l               # "--hp-zone"                               # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :secret_key                        # "-K"                                      # Your HP Cloud Secret Key
    attr_accessor :secret_key_l                      # "--hp-secret"                             # Your HP Cloud Secret Key
    attr_accessor :tenant                            # "-T"                                      # Your HP Cloud Tenant ID
    attr_accessor :tenant_l                          # "--hp-tenant"                             # Your HP Cloud Tenant ID
    attr_accessor :user                              # "-u"                                      # API Client Username
    attr_accessor :user_l                            # "--user"                                  # API Client Username
    attr_accessor :print_after                       # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :purge                             # "-P"                                      # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    attr_accessor :purge_l                           # "--purge"                                 # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    attr_accessor :verbose                           # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                         # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                      # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                    # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts            # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l          # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                              # "-h"                                      # Show help
    attr_accessor :help_l                            # "--help"                                  # Show help
end


class HPKnifeServerListParameters
    attr_accessor :server_url                       # "-s"                                      # Chef Server URL
    attr_accessor :server_url_l                     # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                   # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                 # "--key"                                   # API Client Key
    attr_accessor :colored_optput                   # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                      # "-c"                                      # The configuration file to use
    attr_accessor :config_file_l                    # "--config"                                # The configuration file to use
    attr_accessor :defaults                         # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                  # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :editor                           # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                         # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                      # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                    # "--environment"                           # Set the Chef environment
    attr_accessor :format                           # "-F"                                      # Which format to use for output
    attr_accessor :format_l                         # "--format"                                # Which format to use for output
    attr_accessor :account_id                       # "-A"                                      # Your HP Cloud Access Key ID
    attr_accessor :account_id_l                     # "--hp-account"                            # Your HP Cloud Access Key ID
    attr_accessor :auth_uri                         # "--hp-auth"                               # Your HP Cloud Auth URI
    attr_accessor :availability_zone                # "-Z"                                      # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :availability_zone_l              # "--hp-zone"                               # Your HP Cloud Availability Zone (az1/az2)
    attr_accessor :secret_key                       # "-K"                                      # Your HP Cloud Secret Key
    attr_accessor :secret_key_l                     # "--hp-secret"                             # Your HP Cloud Secret Key
    attr_accessor :tenant                           # "-T"                                      # Your HP Cloud Tenant ID
    attr_accessor :tenant_l                         # "--hp-tenant"                             # Your HP Cloud Tenant ID
    attr_accessor :user                             # "-u"                                      # API Client Username
    attr_accessor :user_l                           # "--user"                                  # API Client Username
    attr_accessor :print_after                      # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :region                           # "--region"                                # Your AWS region
    attr_accessor :tags                             # "-t"                                      # List of tags to output
    attr_accessor :tags_l                           # "--tags"                                  # List of tags to output
    attr_accessor :verbose                          # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                        # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                     # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                   # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts           # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l         # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                             # "-h"                                      # Show help
    attr_accessor :help_l                           # "--help"                                  # Show help
end
