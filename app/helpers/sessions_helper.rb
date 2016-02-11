helpers do
  def current_squirrel
    @current_squirrel ||= Squirrel.find_by(id: session[:squirrel_id])
  end

  def logged_in?
    !!current_squirrel
  end
end
