class FinancialsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
  end

end