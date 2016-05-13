get '/questions' do
  @questions = Question.all

  erb :'questions/index'
end

get '/questions/new' do

  erb :'questions/new'

end

post '/questions' do
  @user = User.find_by(id: session[:user_id])
  @user.questions << Question.create(params[:question])
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
