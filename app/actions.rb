helpers do
  def logged_in?
    !session[:id].nil?
  end

  def get_user
    User.find_by_id(session[:id]) if logged_in?
  end
end


# Home


get '/' do
  erb :index
end


# Login


get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:id] = @user.id
    redirect '/'
  else
    erb :login
  end
end


# Signup


get '/signup' do
  @user = User.new

  erb :signup
end

post '/signup' do
  @user = User.new(user_name: params[:user_name], email: params[:email], password: user[:password])

  if @user.save
    redirect '/'
  else
    erb :signup
  end
end


# Users


get '/users' do
  @users = User.all

  erb :'users/index'
end

get '/users/new' do
  @user = User.new

  erb :'users/new'
end

post '/users/new' do
  @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])

  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by_id(params[:id])

  erb :'/users/show'
end


# Stories


get '/stories' do
  @stories = Story.all

  erb :'stories/index'
end

get '/stories/new' do
  @story = Story.new

  erb :'stories/new'
end

post '/stories/new' do
  @story = Story.new(description: params[:description],
                      tags: params[:tags],
                      scene_id: params[:scene_id])

  if @story.save
    redirect "/stories/#{@story.id}"
  else
    erb :'stories/new'
  end
end

get '/stories/:id' do
  @story = Story.find_by_id(params[:id])

  erb :'stories/show'
end


# Scenes


get '/stories/:id/scenes/:scene_id' do
  @story = Story.find_by_id(params[:id])
  @scene = @story.scenes.find_by_id(params[:scene_id])

  
end