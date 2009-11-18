module Connection
  


  def self.with_proxy?
    ENV['http_proxy'] ? true : false
  end
  
  def self.with_ssl?
    File.exist?(pem_file)
  end
  
  private 
  def self.pem_file
    pem_filename = ENV['USER'] + '.pem'
    File.join(ENV['HOME'],'.certificates', pem_filename)
  end
end
