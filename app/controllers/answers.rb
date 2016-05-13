get '/answers/new' do
  erb :'answers/new'
end

post '/answers' do
  # @user = User.find_by(id: session[:user_id])
  @question.answers << Answer.create(params[:answer])
end
