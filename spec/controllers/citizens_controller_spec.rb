require 'rails_helper'

RSpec.describe CitizensController, type: :controller do
  describe "GET #index" do
    it "responds a 200 response" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      citizen = create(:citizen)
      get :show, params: { id: citizen.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    let(:citizen_params) { { citizen: attributes_for(:citizen) } }

    it "creates a new citizen" do
      puts citizen_params
      expect do
        post :create, params: citizen_params
      end.to change(Citizen, :count).by(1)
    end
  end

  describe "PATCH #update" do
    let(:citizen) { create(:citizen) }
    let(:new_email) { "test#{rand(2**5..(6**9) - 1)}@teste.com" }
    let(:update_params) { { citizen: { email: new_email } } }

    it "updates the citizen" do
      patch :update, params: update_params.merge(id: citizen.id)
      citizen.reload
      expect(citizen.email).to eq(new_email)
    end
  end

  describe "DELETE #destroy" do
    let!(:citizen) { create(:citizen, status: 1) }

    it "sets the status to inactive" do
      expect do
        delete :destroy, params: { id: citizen.id }
        citizen.reload
      end.to change { citizen.status }.from('active').to('inactive')

      expect(response).to have_http_status(:no_content).or have_http_status(:found)
    end
  end
end
