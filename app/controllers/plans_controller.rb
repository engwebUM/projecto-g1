class PlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = 'Plan was successfully created.'
      redirect_to plans_path
    else
      flash[:danger] = 'Plan was unsuccessfully created.'
      render :new
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :slots, :price, :tickets,
      :discount_coupon, :discount_tickets, :description)
  end
end
