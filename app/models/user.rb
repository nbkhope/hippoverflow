class User < ActiveRecord::Base
  include BCrypt

  before_save :add_avatar_url

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def add_avatar_url
    self.avatar_url = "/images/default_avatar.jpg"
  end
end
