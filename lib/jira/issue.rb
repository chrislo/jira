require 'rubygems'
require 'rest_client'
require 'xmlsimple'
require 'ostruct'

module Jira
  class Issue
    def initialize(options = nil)
      @resource = rest_resource(options)
    end

    def rest_resource(options)
      RestClient.proxy = ENV['http_proxy']
      @resource = RestClient::Resource.new(options[:jira_base], options)
    end
    
    def find_all_open_assigned_issues
      res = @resource['sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?resolution=-1&assigneeSelect=issue_current_user'].get
      doc = XmlSimple.xml_in res.to_s 
      open_issues = doc['channel'].first['item']
      issues = open_issues.map {|i| OpenStruct.new(i)}
    end
  end
end
