require_relative 'get_trends'

helpers do
  def logged_in?
    !session[:id].nil?
  end

  def get_user
    User.find_by_id(session[:id]) if logged_in?
  end

  def five_random_trends
     Suggestion.all.sample(5).map { |word| word.noun }
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
  if params[:query]
    @scenes = Scene.where("content LIKE ?", "%#{params[:query]}%").to_a
    
    @stories = []
    @scenes.each do |scene|
      @stories << scene.story unless @stories.include?(scene.story)
    end

    @error_msg = "Couldn't find any stories with keyword: #{params[:query]}" if @stories.nil? || @stories.empty?
  else
    @stories = Story.all
  end

  erb :'stories/index'
end

get '/stories/new' do

  @story = Story.new
  @scene = Scene.new

  erb :'stories/new'
end

post '/stories/new' do
  @story = Story.new

  @scene = Scene.new(content: params[:content],
                      choice1_text: params[:choice1_text],
                      choice2_text: params[:choice2_text])
  @story.scenes << @scene

  if @scene.save && @story.save 
    redirect '/stories'
  else
    erb :'stories/new'
  end
end

get '/stories/:id' do
  begin
    @story = Story.find(params[:id].to_i)
  rescue ActiveRecord::RecordNotFound => e
    @error_msg = e.message
  end

  erb :'stories/show'
end


# Scenes

get '/stories/:story_id/scenes/:scene_id/new' do
  @story = Story.find(params[:story_id].to_i)
  @source = @story.scenes.find(params[:scene_id].to_i)
  @scene = Scene.new
  @scene.errors.add(:choice, 'Cannot add scene without previous choice') unless params[:choice]
  @choice = params[:choice]

  erb :'stories/scenes/new'
end

post '/stories/:story_id/scenes/:scene_id/new' do
  @story = Story.find(params[:story_id].to_i)
  @source = @story.scenes.find(params[:scene_id].to_i)

  @scene = Scene.new(content: params[:content],
                      choice1_text: params[:choice1_text],
                      choice2_text: params[:choice2_text])

  if params[:choice] == '1'
    @source.scene1 = @scene
  elsif params[:choice] == '2'
    @source.scene2 = @scene
  end

  @scene.story = @story

  if @source.save
    redirect "/stories/#{params[:story_id]}/scenes/#{@scene.id}"
  else
    erb :'stories/scenes/new'
  end
end

get '/stories/:story_id/scenes/:scene_id' do
  begin
    @story = Story.find(params[:story_id].to_i)
    @scene = @story.scenes.find(params[:scene_id].to_i)
  rescue ActiveRecord::RecordNotFound => e
    @error_msg = e.message
  end

  erb :'stories/scenes/show'
end

