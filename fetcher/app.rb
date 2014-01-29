require 'bundler'
require 'sunlight/congress'
require 'json'
Bundler.require
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class FetcherApp < Sinatra::Base
  get '/' do
    "Hello, World!"
  end

  get '/:zipcode' do
    content_type :json
    legislators = Legislator.new(params[:zipcode])
    legislators.get_legislators
  end

  run! if app_file == $0
end
