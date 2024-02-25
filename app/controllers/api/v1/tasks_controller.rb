class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    task = current_user.tasks.build(title: params[:title], description: params[:description], color: params[:color], status: params[:status])
    if task.save
      render json: task, status: :ok
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    task = current_user.tasks.find(params[:id])
    if task.update(update_params)
      render json: task, status: :ok
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    if task.destroy
      render json: task, status: :ok
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    tasks = current_user.tasks
    render json: tasks, status: :ok
  end

  private

  def update_params
    params.permit(:status, :title, :description, :color)
  end
end
