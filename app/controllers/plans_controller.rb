class PlansController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_plan, only: [:edit, :update, :destroy]

  def index
    @plans = Plan.paginate(page: params[:page])
  end

  def new
    @plan = Plan.new
  end

  def edit
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
    if @plan.update(plan_params)
      flash[:success] = 'Plan was successfully updated.'
      redirect_to edit_plan_path
    else
      flash[:danger] = 'Plan was not updated.'
      render :edit
    end
  end

  def destroy
    if @plan.destroy
      flash[:success] = 'Plan was successfully removed.'
    else
      flash[:danger] = 'Plan was not removed.'
    end
    redirect_to plans_path
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :slots, :price, :tickets,
      :discount_coupon, :discount_tickets, :description)
  end
end
