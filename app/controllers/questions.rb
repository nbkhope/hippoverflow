post '/questions/:id/votes' do
  question = Question.find_by(id: params[:id])

  case params[:vote_type]
  when "up"
    value = 1
  when "down"
    value = -1
  end

  questions.votes << Vote.new(reaction: value)

  if request.xhr?
    questions.points
  else
    redirect "/questions/#{questions.id}"
  end
end

get '/questions' do
  @questions = Question.all

  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])

  erb :'questions/show'
end
