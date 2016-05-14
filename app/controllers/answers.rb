get '/answers/new' do
  erb :'answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  answer = Answer.new(params[:answer])
  answer.question = @question
  answer.user = current_user
  @question.answers << answer

  redirect "/questions/#{@question.id}"
end
