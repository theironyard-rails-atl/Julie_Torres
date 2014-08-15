require 'sinatra'

get '/reverse' do
  @text = params[:text]
  @chars = params[:text]
  haml :reverse
end

post '/reverse' do
  @text = "You posted '#{params[:text].reverse}'"
  @chars = "Your post has #{params[:text].split.map(&:length).reduce(:+)} characters"
  haml :reverse
end
