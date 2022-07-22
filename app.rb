require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "It's Morbin' Time"
  end

  get '/peeps' do
    ['It was another uneventful day in Badger Falls',
    'Where the women are robust, the men are pink cheeked',
    'And the children are pink cheeked and robust']
  end

  run! if app_file == $0
end