get '/' do
  @squirrels = Squirrel.all
  erb :'squirrels/index'
end

get '/squirrels' do
  redirect '/'
end

get '/squirrels/new' do
  @trees = Tree.all
  erb :'squirrels/new'
end

post '/squirrels' do
  squirrel = Squirrel.create(name: params[:name], color: params[:color], tree_id: params[:tree_id])
  redirect "/squirrels/#{squirrel.id}"
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
