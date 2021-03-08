require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do 

    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do 
    erb :"peeps/new"
  end

  post '/peeps' do 
    Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do 
    erb :"sessions/new"
  end

  post '/sessions' do 
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id 
      redirect('/peeps')
    else
      flash[:notice] = 'Check your blooming email or password!'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do 
    session.clear 
    flash[:notice] = 'You have signed out.' 
    redirect('/peeps')
  end 


  run! if app_file == $0
end
