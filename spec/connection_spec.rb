require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Connection" do
  it "should use a proxy if the http_proxy environment variable is set" do
    ENV['http_proxy'] = 'proxy'
    Connection.with_proxy?.should be_true
  end
  
  it "should use ssl connection if a pem file exists" do
    ENV['USER'] = 'bob'
    ENV['HOME'] = '/users/bob/'
    expected_pem = '/users/bob/.certificates/bob.pem'
    File.stub!(:exist?).with(expected_pem).and_return(true)
    Connection.with_ssl?.should be_true
  end
end
