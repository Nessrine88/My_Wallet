# spec/controllers/entities_controller_spec.rb

require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }

  describe "POST #create" do
    context "when user is logged in" do
      before { sign_in user }

      it "creates a new entity with valid attributes" do
        expect {
          post :create, params: { entity: { name: "Transaction", amount: 100, group_id: 1 } }
        }.to change(Entity, :count).by(1)

        expect(response).to redirect_to(group_path)
        expect(flash[:success]).to eq('Transaction created successfully')
      end

      it "does not create a new entity with invalid attributes" do
        expect {
          post :create, params: { entity: { name: "", amount: nil, group_id: 1 } }
        }.not_to change(Entity, :count)

        expect(response).to render_template(:new)
        expect(flash[:error]).to eq('Something went wrong when creating the transaction')
      end
    end

    context "when user is not logged in" do
      it "redirects to the sign-in page" do
        post :create, params: { entity: { name: "Transaction", amount: 100, group_id: 1 } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
