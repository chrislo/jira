require 'rubygems'
require 'httparty'

module Jira
  class Issue
    include HTTParty
    format :xml
    
    options = Jira.configuration
    puts options
    
    def self.find_all_open_assigned_issues
      res = get('https://jira.dev.bbc.co.uk/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml',
                :query => {
                  'resolution' => -1,
                  'assigneeSelect' => 'issue_current_user',
                  'sorter/field' => 'priority',
                  'sorter/order' => 'DESC',
                  'tempMax' => 1000
                })

      open_issues = res["rss"]["channel"]["item"]
      issues = open_issues.map {|i| OpenStruct.new(i)}
    end
  end
end
