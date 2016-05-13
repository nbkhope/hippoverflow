def get_random_content_array
	[
		Faker::Lorem.paragraph,
		Faker::Lorem.sentences(1..5).join("\n")
	]
end

User.delete_all
Question.delete_all
Answer.delete_all

# Create users
40.times do
	User.create(
		username: Faker::Internet.user_name,
		email: Faker::Internet.email,
		avatar_url: Faker::Avatar.image,
		password: "123"
		#password: Faker::Internet.password
	)
end

# Create questions
200.times do
	random_title = [
		Faker::Beer.name, 
		Faker::Book.title, 
		Faker::Hipster.sentence(3), 
		Faker::Hacker.say_something_smart,
		Faker::Lorem.sentence
	]
	random_content = get_random_content_array

	# Create fake question
	question = Question.new(
		title: random_title.sample,
		content: random_content.sample,
	)

	# Assign question to a random user
	User.all.sample << question
end

160.times do
	answer = Answer.new(
		content: get_random_content_array.sample
	)

	# Assign the answer to a random user
	answer.user = User.all.sample

	# Attach the answer to a random question
	# (<< operator saves to the DB)
	Question.all.sample << answer
end

