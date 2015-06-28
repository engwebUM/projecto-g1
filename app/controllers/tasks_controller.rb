class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_unfinished_tasks = Sponsor.from_user(current_user).with_open_state.paginate(page: params['page_unfinished'])
    @finished_tasks = Sponsor.with_closed_state.paginate(page: params['page_finished'])
    @states = State.all
  end

  def show
    @tasks = Sponsor.with_state(params[:id]).paginate(page: params['page'], per_page: 10)
    @selected_state = State.find_by(id: params[:id])
    @states = State.all.by_alphabetical_order
  end

  def update_state
    @task = Sponsor.find(params[:task])

    if @task.update_attribute(:state_id, params[:state])
      render json: { message: 'Task state was successfully updated.' }
    else
      render json: { message: 'Task state was not updated.' }
    end
  end
end
