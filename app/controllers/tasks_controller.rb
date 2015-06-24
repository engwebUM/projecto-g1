class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_unfinished_tasks = Sponsor.where(user: current_user).where.not(state: State.closed).paginate(page: params['page_unfinished'])
    @finished_tasks = Sponsor.where(state: State.closed).paginate(page: params['page_finished'])
    @states = State.all
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
