class TasksController < ApplicationController
  def index
    @user_unfinished_tasks = Sponsor.where(user: current_user).where.not(state: State.closed).paginate(page: params['page_unfinished'])
    @finished_tasks = Sponsor.where(state: State.closed).paginate(page: params['page_finished'])
  end
end
