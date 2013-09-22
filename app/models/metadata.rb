class Metadata
  def self.content_type(url)
    uri = URI(url)
    Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.head(uri.path)["content-type"]
    end
  rescue => e
    Rails.logger.warn("Error when downloading content type for url: #{url}\n#{e.to_s}")
  end
end
