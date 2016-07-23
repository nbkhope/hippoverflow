post '/questions/:id/vote' do
  question = Question.find_by(id: params[:id])

  case params[:vote_type]
  when "up"
    value = 1
  when "down"
    value = -1
  end

  vote = Vote.new(reaction: value)
  vote.user = current_user
  question.votes << vote

  if request.xhr?
    question.points
  else
    redirect "/questions/#{question.id}"
  end
end

get '/questions' do
  @questions = Question.order(created_at: :desc)

  erb :'questions/index'
end

get '/questions/new' do

  erb :'questions/new'

end

post '/questions' do
  @user = User.find_by(id: session[:user_id])
  question = Question.new(params[:question])
  question.user = @user
  @user.questions << question

  redirect "/questions/#{question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
