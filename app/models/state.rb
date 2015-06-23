class State < ActiveRecord::Base
  has_many :sponsors

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :is_final, in: [true, false]

  def self.closed
    State.where(is_final: true)
  end

  private

  def display_name
    name.capitalize
  end
end
