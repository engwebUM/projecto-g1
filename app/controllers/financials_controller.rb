class FinancialsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
    return_of_investiment
  end

  private

  def return_of_investiment
    @hash = {}
    @plans.each do |plan|
      @hash[plan.name] = (plan.return_of_investiment).round(2)
    end
    @hash
  end
end
