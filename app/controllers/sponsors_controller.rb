class SponsorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  before_action :set_states, only: [:index, :new,  :create, :edit, :update]

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
      flash[:danger] = 'Sponsor was unsuccessfully created.'
      render :new
    end
  end

  def destroy
    if @sponsor.destroy
      flash[:success] = 'Sponsor was successfully removed'
    else
      flash[:danger] = 'Sponsor was not removed'
    end
    redirect_to sponsors_path
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to sponsors_path
    else
      render 'edit'
    end
  end

  private

  def set_states
    @states = State.all
  end

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:organization, :person_name, :person_role, :person_email, :person_phone, :extra_pay, :state, :next_step, :user_id, :plan_id, :notes)
  end
end
