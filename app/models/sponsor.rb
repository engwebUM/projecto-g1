class Sponsor < ActiveRecord::Base
  has_one :plan
  has_one :user

  validates :organization, presence: true, uniqueness: true
  validates :person_name, presence: true
  validates :person_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :extra_pay, allow_nil: true, numericality: true
end
