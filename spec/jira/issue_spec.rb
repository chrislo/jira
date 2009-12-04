require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

module Jira
  describe Issue do
    before(:each) do
      options[:base_path] = 'https://my.jira'
      FakeWeb.allow_net_connect = false
      FakeWeb.register_uri(:get,
                           "#{options[:base_path]}/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?resolution=-1&assigneeSelect=issue_current_user",
                           :body => File.read(File.expand_path(File.join(File.dirname(__FILE__), '..', 'fixtures', 'issues.xml'))))
      @ji = Jira::Issue.new(options)
    end
    
    describe "initialize" do
    end
    
    describe "find_all_open_assigned_issues" do
      it "should return a list of open issues" do
        issues = @ji.find_all_open_assigned_issues
        issues.map {|i| i.title}.flatten.should include('[TST-14301] Test')
      end
    end
  end
end
