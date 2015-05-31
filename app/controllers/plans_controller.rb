class PlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = 'Plan was successfully created.'
      redirect_to plans_path
    else
      flash[:danger] = 'Plan was not created.'
      render :new
    end
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      flash[:success] = 'Plan was successfully updated.'
      redirect_to edit_plan_path
    else
      flash[:danger] = 'Plan was not updated.'
      render :edit
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :slots, :price, :tickets,
      :discount_coupon, :discount_tickets, :description)
  end
end
