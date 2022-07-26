require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "It's Morbin' Time"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end

  
  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep_id = params[:id]
    erb :'peeps/edit'
  end 

  patch '/peeps/:id' do
    connection = PG.connect(dbname: 'chitter2_test')
    connection.exec_params(
      "UPDATE peeps SET content = $1 WHERE id = $2",
      [ params[:content], params[:id] ]
    )
    redirect '/peeps'
  end 

  run! if app_file == $0
end