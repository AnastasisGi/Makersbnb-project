class MakersBnB < Sinatra::Base
  get '/registrations/new' do
    erb(:'registrations/new')
  end

  post '/registrations' do
  # create a user stuff
    user = User.new(email: params[:email])
    user.password = params[:password]
    if user.save!
      session[:user_id]=user.id
    redirect ('/')
    else
    end
  end
end
