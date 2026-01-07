require 'sinatra'
require 'json'

class App < Sinatra::Base
  # Halaman utama
  get '/' do
    erb :index
  end
  
  # API endpoint
  get '/api/hello' do
    content_type :json
    {
      message: "Hello from Ruby!",
      timestamp: Time.now.to_s,
      ruby_version: RUBY_VERSION,
      status: "live"
    }.to_json
  end
  
  # Form handler
  post '/greet' do
    @name = params[:name]
    erb :greet
  end
  
  # Health check
  get '/health' do
    "OK - Server running"
  end
end
