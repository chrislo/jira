require 'cgi'

class Hash
  def to_query
    attributes = keys.dup
    attributes.sort!{|a,b| a.to_s <=> b.to_s}
    attributes.map!{|k| "#{k}=#{CGI::escape(self[k].to_s)}"}
    attributes.join('&')
  end
end