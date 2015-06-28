class SponsorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_sponsor, only: [:edit, :update, :destroy]
  before_action :set_states, only: [:new, :create, :edit, :update]
  before_action :set_users, only: [:new, :create, :edit, :update]
  before_action :set_plans, only: [:new, :create, :edit, :update]

  def index
    @sponsors = Sponsor.paginate(page: params[:page])
  end

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      flash[:success] = 'Sponsor was successfully created.'
      redirect_to sponsors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      flash[:success] = 'Sponsor was successfully updated.'
      redirect_to sponsors_path
    else
      render :edit
    end
  end

  def destroy
    @sponsor.destroy
    flash[:success] = 'Sponsor was successfully removed.'
    redirect_to sponsors_path
  end

  private

  def set_states
    @states = State.all
  end

  def set_plans
    @plans = Plan.all
  end

  def set_users
    @users = User.all
  end

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:organization, :person_name, :person_role, :person_email, :person_phone, :extra_pay, :next_step, :notes, :user_id, :plan_id, :state_id)
  end
end
