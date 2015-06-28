class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :sponsor
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: EMAIL_REGEX, uniqueness: true

  def shortened_name
    first_name + ' ' + last_name[0] + '.'
  end
end
