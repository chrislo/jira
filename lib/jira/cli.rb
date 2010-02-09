require 'optparse'

module Jira
  class CLI
    attr_reader :action, :options, :args
    
    def self.execute
      parse(ARGV).execute!
    end
    
    def self.parse(args)
      cli = new(args)
      cli.parse_options!
      cli.load_options_from_file
      cli
    end
 
    def initialize(args)
      @args = args.dup
    end
    
    def execute!
      case action
      when /[A-Z]+-\d+/i
        handle_ticket(action)
      when 'list'
        handle_ticket_list
      else
        puts 'not a command'
      end
    end
    
    def handle_ticket_list
      issues = Jira::Issue.new(@options).list_all_open_assigned_issues
      puts issues
    end
    
    def handle_ticket(ticket_number)
      ticket = Jira::Issue.new(@options).find_by_ticket_number(ticket_number)
      puts ticket.title
      puts ticket.description
      puts "#{ticket.assignee} (#{ticket.resolution})"
    end
    
    def parse_options!
      if args.empty?
        warn "Please specify at least one action to execute."
        puts " list"
        exit
      end
 
      @action = args.first
    end

    def load_options_from_file
      options_file = File.join(ENV['HOME'],'.jira')
      if File.exists?(options_file)
        loaded_options = YAML.load_file(File.join(ENV['HOME'],'.jira'))
      else
        abort "You need a ~/.jira"
      end

      @options = {}
      @options[:jira_base] = loaded_options[:jira_base]
      
      if loaded_options.has_key? :pem
        pem_contents = File.read(File.expand_path(loaded_options[:pem]))
        @options[:ssl_client_cert]  =  OpenSSL::X509::Certificate.new(pem_contents)
        @options[:ssl_client_key]   =  OpenSSL::PKey::RSA.new(pem_contents)
        @options[:verify_ssl]       =  OpenSSL::SSL::VERIFY_NONE        
      end
    end
  end
end
