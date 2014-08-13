require 'httparty'


class Emoji
  def initialize(data)
    @data = data
  end

  def available_emoji
    @data.keys
  end

  def img_url(emoji_name)
    @data[emoji_name]
  end
end


class Github
  include HTTParty
  #base_uri 'https://assets-cdn.github.com'


  def self.emoji_of(emoji_name)
    response = get "https://api.github.com/emojis", headers: { "User-Agent" => "Working_Emoji_App" }
    omniscient_bob= Emoji.new(response)
  end
end
