# Show a user's profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
