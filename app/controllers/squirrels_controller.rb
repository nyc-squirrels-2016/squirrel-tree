get '/' do
  @squirrels = Squirrel.all
  erb :'squirrels/index'
end

get '/squirrels' do
  redirect '/'
end

get '/squirrels/new' do
  @squirrel = Squirrel.new
  @trees = Tree.all
  erb :'squirrels/new'
end

post '/squirrels' do
  @squirrel = Squirrel.new(build_squirrel_params(params))
  if @squirrel.save
    redirect "/squirrels/#{@squirrel.id}"
  else
    @errors = @squirrel.errors.full_messages
    erb :'squirrels/new'
  end
end

get '/squirrels/:id' do
  @squirrel = Squirrel.find_by(id: params[:id])
  if @squirrel
    erb :'squirrels/show'
  else
    redirect '/'
  end
end

get '/squirrels/:id/edit' do
  redirect '/' unless logged_in? && params[:id].to_i == current_squirrel.id
  @squirrel = Squirrel.find_by(id: params[:id])
  if @squirrel
    erb :'squirrels/edit'
  else
    redirect '/'
  end
end

put '/squirrels/:id' do
  squirrel = Squirrel.find(params[:id])
  squirrel.update(name: params[:name], color: params[:color])
  redirect "/squirrels/#{squirrel.id}"
end

delete '/squirrels/:id' do
  squirrel = Squirrel.find(params[:id])
  squirrel.destroy
  redirect '/'
end

def build_squirrel_params(params)
  tree = Tree.where(location: params[:tree_location]).first_or_create
  params[:squirrel].merge({tree_id: tree.id})
end
