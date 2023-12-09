# require 'rails_helper'

# RSpec.describe EntitiesController, type: :controller do
#   describe 'POST #create' do
#     let(:user) { create(:user) }
#     let(:group) { create(:group) }

#     before do
#       sign_in user
#     end

#     context 'with valid parameters' do
#       it 'creates a new entity' do
#         entity_params = attributes_for(:entity, group_id: group.id)
#         post :create, params: { entity: entity_params }

#         expect(Entity.count).to eq(1)
#         expect(response).to redirect_to(group_path(@group))
#         expect(flash[:success]).to eq('Transaction created successfully')
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new entity' do
#         entity_params = attributes_for(:entity, name: nil, group_id: group.id) # Assuming name is a required attribute
#         post :create, params: { entity: entity_params }

#         expect(Entity.count).to eq(0)
#         expect(response).to render_template(:new)
#         expect(flash[:notice]).to be_present
#       end
#     end
#   end
# end
