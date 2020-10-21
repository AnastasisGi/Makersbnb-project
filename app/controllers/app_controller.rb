class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :root, File.dirname(File.expand_path('..', __FILE__))
  enable :sessions
  enable :method_override


   before '/' do
     authenticate!
   end


  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate!
    redirect '/sign_in' if current_user.nil?
  end

end
