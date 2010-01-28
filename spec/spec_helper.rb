$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'

require 'jira'

require 'rubygems'
require 'fakeweb'

FakeWeb.allow_net_connect = false

Spec::Runner.configure do |config|

end
