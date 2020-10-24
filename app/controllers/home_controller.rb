class MakersBnB < Sinatra::Base

get '/' do
  @spaces = Spaces.all

  erb(:index)
end

end
