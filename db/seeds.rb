User.delete_all
Question.delete_all

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
	random_content = [
		Faker::Lorem.paragraph,
		Faker::Lorem.sentences(1..5).join("\n")
	]

	# Create fake question
	question = Question.new(
		title: random_title.sample,
		content: random_content.sample,
	)

	# Assign question to a random user
	User.all.sample << question
end
