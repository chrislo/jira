require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe Hash do
    before(:each) do
    end
    
  describe "to_query" do
    it "should convert a hash to a query string" do
      h = {:pid => 12345, :issuetype => 3}
      h.to_query.should == "issuetype=3&pid=12345"
    end
    
    it "should escape spaces in strings" do
      h = {:pid => 12345, :summary => "A long summary string"}
      h.to_query.should include("summary=A+long+summary+string")
    end
  end
end
