class State
  ALL_STATES = %w(Suggested Contacted Pending Accepted Rejected)
  CLOSED_STATES = %w(Accepted Rejected)

  def self.all
    ALL_STATES
  end

  def self.closed
    CLOSED_STATES
  end
end
