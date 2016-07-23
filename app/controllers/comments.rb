get '/questions/:id/comments/new' do
  @question = Question.find_by(params[:id])
  erb :'comments/new'
end

get '/answers/:id/comments/new' do
  @answer = Answer.find_by(id: params[:id])
  erb :'comments/new'
end

post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])

  comment = Comment.new(params[:comment])
  comment.user = current_user
  @question.comments << comment

  redirect "/questions/#{@question.id}"
end

post '/answers/:id/comments' do
  @answer = Answer.find_by(id: params[:id])

  comment = Comment.new(params[:comment])
  comment.user = current_user
  @answer.comments << comment

  redirect "/questions/#{@answer.question.id}"
end
