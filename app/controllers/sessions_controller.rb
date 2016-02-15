get '/login' do
  redirect '/' if logged_in?
  erb :login
end

post '/login' do
  squirrel = Squirrel.find_by(username: params[:username])
  if squirrel && squirrel.password == params[:password]
    session[:squirrel_id] = squirrel.id
    redirect '/'
  else
    @errors = ["Incorrect username or password. Please try again."]
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
