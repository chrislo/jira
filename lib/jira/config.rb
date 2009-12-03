require 'yaml'
require 'uri'

module Jira
  def self.configuration
    config_file = File.join(ENV['HOME'],'.jira.yml')
    begin 
      config = YAML.load_file(config_file)
      raise "Invalid configuration - #{config_file}" if !config.is_a?(Hash)
      puts "Loaded config from #{config_file}"
    rescue => e
      puts "Could not read config file. Using defaults"
      puts e.to_s
      config = {}
    end
    return config
  end
end
