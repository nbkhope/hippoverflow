# Show the form to create a new account
get '/users/new' do
  #@user = User.new
  erb :'users/new'
end

get '/register' do
  redirect '/users/new'
end

# Creates a user account
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    # If account was created successfully, redirect to login page
    redirect "/login"
  else
    erb :'users/new'
  end
end




