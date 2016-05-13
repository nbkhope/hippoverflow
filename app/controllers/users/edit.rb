# Show the form to edit a user's profile
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

# Route to update a user's profile
put 'users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])

  if @user.save
    # If saved succesfully, go back to user's profile page
    redirect "/users/#{@user.id}"
  else
    erb :'/users/edit'
  end
end

# Route to delete a user
delete '/users/:id' do
  @user = User.find(params[:id])

  @user.destroy

  redirect '/'
end
