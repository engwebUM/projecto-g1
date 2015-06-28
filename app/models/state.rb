class State < ActiveRecord::Base
  has_many :sponsors

  default_scope { order(updated_at: :DESC) }
  scope :by_alphabetical_order, -> { reorder(:name) }

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :is_final, in: [true, false]

  def self.closed
    State.where(is_final: true)
  end

  def self.opened
    State.where(is_final: false)
  end

  def display_name
    name.titleize
  end

  def display_is_final
    if is_final
      'Yes'
    else
      'No'
    end
  end
end
