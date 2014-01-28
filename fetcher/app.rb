require 'bundler'
Bundler.require

class FetcherApp < Sinatra::Base
  get '/' do
    "Hello, World!"
  end

  run! if app_file == $0
end
