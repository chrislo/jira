require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

module Jira
  describe Issue do
    before(:each) do
      FakeWeb.allow_net_connect = false
      FakeWeb.register_uri(:get,
                           "https://jira.dev.bbc.co.uk/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?sorter/field=priority&resolution=-1&assigneeSelect=issue_current_user&tempMax=1000&sorter/order=DESC",
                           :body => File.read(File.expand_path(File.join(File.dirname(__FILE__), '..', 'fixtures', 'issues.xml'))))
    end

    describe "find_all_open_assigned_issues" do
      it "should return a list of open issues" do
        issues = Jira::Issue.find_all_open_assigned_issues
        issues.map {|i| i.title}.should include('[TST-14301] Test')
      end
    end
  end
end
