class SponsorsController < ApplicationController
  before_filter :authenticate_user!

  FIRST_CONTACT_STATE = 'First Contact'
  FINISHED_CONTACT_STATE = 'Finished'

  STATES = [[FIRST_CONTACT_STATE, 1], [FINISHED_CONTACT_STATE, 2]]

  def index
    @sponsors = Sponsor.all
    @steps = STATES
  end

  def show
  end

  def new
    @sponsor = Sponsor.new
    @steps = STATES
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    @steps = STATES
    if @sponsor.save
      flash[:success] = 'Sponsor was successfully created.'
      redirect_to sponsors_path
    else
      flash[:danger] = 'Sponsor was unsuccessfully created.'
      render :new
    end
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
    @steps = STATES
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update(sponsor_params)
      redirect_to bookings_path
    else
      render 'edit'
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:organization, :person_name, :person_role, :person_email, :person_phone, :extra_pay, :state, :next_step, :user_id, :plan_id, :notes)
  end
end
