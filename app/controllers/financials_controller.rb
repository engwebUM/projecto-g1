class FinancialsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
    @graphic = Graphic.new(@plans)
  end

end
