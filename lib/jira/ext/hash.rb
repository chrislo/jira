require 'cgi'

class Hash
  def to_query
    query = []
    self.each_pair do |key,value|
      query << "#{key}=#{CGI::escape(value.to_s)}"
    end
    query.join('&')
  end
end
