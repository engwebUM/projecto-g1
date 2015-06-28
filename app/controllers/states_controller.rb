class StatesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_state, only: [:edit, :update, :destroy]
  before_action :paginate_states, only: [:index, :edit, :new]

  def index
    @state = State.new
  end

  def new
    @state = State.new
    render :index
  end

  def edit
    render :index
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = 'State was successfully created.'
      redirect_to states_path
    else
      render :new
    end
  end

  def update
    if @state.update(state_params)
      flash[:success] = 'State was successfully updated.'
      redirect_to states_path
    else
      render :edit
    end
  end

  def destroy
    if @state.sponsors.exists?
      flash[:danger] = 'There are Sponsors with this State'
    else
      @state.destroy
      flash[:success] = 'State was successfully removed.'
    end
    redirect_to states_path
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def paginate_states
    @states = State.paginate(page: params[:page], per_page: 10)
  end

  def state_params
    params.require(:state).permit(:name, :is_final)
  end
end
