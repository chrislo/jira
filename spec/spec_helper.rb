$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'

require 'jira'

require 'rubygems'
require 'fakeweb'

Spec::Runner.configure do |config|
end
