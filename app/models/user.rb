class User < ActiveRecord::Base
  has_many :subscription
  has_many :channels, through: :subscription, source: :channel









  validates :username, presence: true, uniqueness:
  { message: "Username has already been taken!" }

  validates :email, presence: true, uniqueness:
  { message: "Email has already been taken!" }

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    valid_user = User.find_by(email: email)
    valid_user.password == password ? valid_user : nil
  end

end
