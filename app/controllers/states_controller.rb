class StatesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def index
    @states = State.all
    paginate_states
    @state = State.new
  end

  def new
    @state = State.new
  end

  def edit
    @states = State.all
    paginate_states
    render :index
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = 'State was successfully created.'
      redirect_to states_path
    else
      flash[:danger] = 'State was not created.'
      render :new
    end
  end

  def update
    if @state.update(state_params)
      flash[:success] = 'State was successfully updated.'
      redirect_to states_path
    else
      flash[:danger] = 'State was not updated.'
      render :edit
    end
  end

  def destroy
    if !@state.sponsors.empty?
      flash[:danger] = 'There are Sponsors with this State'
    elsif @state.destroy
      flash[:success] = 'State was successfully removed.'
    else
      flash[:danger] = 'State was not removed.'
    end
    redirect_to states_path
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def paginate_states
    @states = @states.paginate(page: params[:page], per_page: 10)
  end

  def state_params
    params.require(:state).permit(:name, :is_final)
  end
end
