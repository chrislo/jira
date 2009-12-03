require 'pathname'
dir = Pathname(__FILE__).dirname.expand_path

require dir + 'jira/config'
require dir + 'jira/issue'
