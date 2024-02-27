require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory set up with FactoryBot

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    it 'creates a new task' do
      post :create, params: { title: 'New Task', description: 'Task Description', color: 'blue', status: 'todo' }
      expect(response).to have_http_status(:ok)
      expect(Task.count).to eq(1)
    end

    it 'returns errors if task creation fails' do
      post :create, params: { title: '', description: '', color: '', status: '' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors']).to be_present
    end
  end

  describe 'PUT #update' do
    let(:task) { create(:task, user: user) } # Assuming you have a Task factory set up with FactoryBot

    it 'updates an existing task' do
      put :update, params: { id: task.id, title: 'Updated Task' }
      expect(response).to have_http_status(:ok)
      expect(Task.find(task.id).title).to eq('Updated Task')
    end

    it 'returns errors if task update fails' do
      put :update, params: { id: task.id, title: '' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors']).to be_present
    end
  end

  describe 'DELETE #destroy' do
    let!(:task) { create(:task, user: user) } # Assuming you have a Task factory set up with FactoryBot

    it 'deletes an existing task' do
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #index' do
    let!(:tasks) { create_list(:task, 3, user: user) } # Assuming you have a Task factory set up with FactoryBot

    it 'returns a list of tasks' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end
