class UStream
  include HTTParty

  base_uri 'api.ustream.tv'
  default_params :key => 'AF28FB60599C8F91B9C10BC360913621'
  format :xml

  def initialize(channel)
    @channel = channel
  end

  def command(method)
    UStream.get("/xml/channel/#{@channel}/#{method}")
  end

  def getInfo
    @info ||= command(:getInfo)
  end

  def listAllVideos
    @videos ||= command(:listAllVideos)
  end

  def status
    getInfo['xml']['results']['status']
  end

  def title
    getInfo['xml']['results']['title']
  end

  def image
    getInfo['xml']['results']['imageUrl']
  end

  def embed
    getInfo['xml']['results']['embedTag']
  end

  def url
    getInfo['xml']['results']['url']
  end
end
