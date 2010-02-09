require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

module Jira
  describe Issue do

    before(:each) do
      @options = {}
      @options[:jira_base] = 'https://my.jira'
        
      FakeWeb.register_uri(:get,
                           "#{@options[:jira_base]}/si/jira.issueviews:issue-xml/TST-14301/TST-14301.xml",
                           :body => File.read(File.expand_path(File.join(File.dirname(__FILE__), '..', 'fixtures', 'TST-14301.xml'))))
    end

    describe "sanitize the description" do
      it "should sanitize the description of the issue" do
        Sanitize.should_receive(:clean).with("A test ticket")
        ticket = Jira::Issue.new(@options).find_by_ticket_number('TST-14301')
      end
    end

    describe "details for an individual issue" do
      before(:each) do
        ji = Jira::Issue.new(@options)
        @ticket = ji.find_by_ticket_number('TST-14301')
      end

      it "should return the title of the issue" do
        @ticket.title.should == "[TST-14301] Test"
      end

      it "should return the description of the issue" do
        @ticket.description.should == "A test ticket"
      end

      it "should return the assignee of a ticket" do
        @ticket.assignee.should == "chris.lowis"
      end
      
      it "should return the resolution status of the ticket" do
        @ticket.resolution.should == "Unresolved"
      end
    end

    describe "finding and listing issues" do
      before(:each) do
        options[:jira_base] = 'https://my.jira'
        FakeWeb.register_uri(:get,
                             "#{options[:jira_base]}/sr/jira.issueviews:searchrequest-xml/temp/SearchRequest.xml?resolution=-1&assigneeSelect=issue_current_user",
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
      
      describe "list all open assigned issues" do
        it "should give a formated list of issue titles" do
          @ji.stub!(:find_all_open_assigned_issues).
            and_return([OpenStruct.new(:title => "An issue"),OpenStruct.new(:title => "A second issue")])
          @ji.list_all_open_assigned_issues.should == "* An issue\n* A second issue"
        end
      end
    end
    
  end
end
