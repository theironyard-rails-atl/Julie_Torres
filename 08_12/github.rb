require 'haml'
require 'sinatra'
require './lib/repo'


get '/repos' do
  emoji_name = params[:emoji] || "shipit"
  @omniscient_bob = Github.emoji_of(emoji_name)
  @url = @omniscient_bob.img_url(emoji_name)
  @available_emoji = @omniscient_bob.available_emoji
  #@repos= "https://assets-cdn.github.com/images/icons/emoji/unicode/1f620.png?v5"
  haml :github
end
