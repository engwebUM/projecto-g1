class Sponsor < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user
  belongs_to :state

  default_scope { order(updated_at: :DESC) }
  scope :from_user, ->(user) { where(user: user) }
  scope :with_state, ->(state) { where(state: state) }
  scope :with_open_state, -> { where(state: State.opened) }
  scope :with_closed_state, -> { where(state: State.closed) }

  self.per_page = 5

  validates :organization, presence: true, uniqueness: true
  validates :person_name, presence: true
  validates :person_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :extra_pay, allow_nil: true, numericality: true

  def state_name
    state.name.capitalize
  end

  def plan_name
    plan.name.capitalize
  end
end
