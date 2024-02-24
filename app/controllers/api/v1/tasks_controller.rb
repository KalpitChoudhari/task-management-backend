class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    tasks = current_user.tasks
    render json: tasks, status: :ok
  end
end
