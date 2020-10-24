class MakersBnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

get '/add_space' do
  erb(:add_space)
end



post '/spaces' do
  space = Spaces.create(name: params[:name],description: params[:description],price: params[:price])
  # space.save!
  # p "print all........................ #{Spaces.all}"
  redirect '/'
end



end
