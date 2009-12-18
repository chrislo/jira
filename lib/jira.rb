require 'pathname'
dir = Pathname(__FILE__).dirname.expand_path

require dir + 'jira/issue'
require dir + 'jira/cli'
require dir + 'jira/ext/hash'
