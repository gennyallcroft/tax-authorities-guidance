require 'sinatra/base'
require './app/models/Guidance.rb'

class ApplicationManager < Sinatra::Base

  configure do
    enable :session
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/'  do
    erb(:index)
  end

  get '/guidance' do
    @guidance = Guidance.list
    erb(:guidance)
  end





  run! if app_file == $0

end
