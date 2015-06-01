class TasksController < ApplicationController
  def index
    @user_unfinished_tasks = Sponsor.where(user: current_user).where.not(state: State.closed)
    @finished_tasks = Sponsor.where(state: State.closed)
  end
end
