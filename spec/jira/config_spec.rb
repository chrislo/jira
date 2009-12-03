require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

module Jira
  describe Config do
    describe "with a config file at ~/.jirarc" do
      before(:each) do
        @config_hash = {
          'jira_base_path' => 'jira_base_path',
          'pem_file' => 'pem_file',
          'http_proxy' => 'http://www.httpproxy.com:80'
        }

        YAML.should_receive(:load_file).and_return(@config_hash)

        @config = Jira.configuration
      end

      it "should return the config hash" do
        @config.should == @config_hash
      end
    end
  end
end
