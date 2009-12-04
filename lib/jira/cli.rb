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
      cli.load_global_options
      cli
    end
 
    def initialize(args)
      @args = args.dup
    end
    
    def execute!
      case action
      when 'list':
          handle_ticket_list
      else
        puts 'not a command'
      end
    end

    def parse_options!
      if args.empty?
        warn "Please specify at least one action to execute."
        puts " list"
        exit
      end
 
      @action = args.first
    end
  end
end
