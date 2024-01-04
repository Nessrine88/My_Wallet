# require 'rails_helper'

# RSpec.describe GroupsController, type: :controller do
#   describe 'POST #create' do
#     context 'with valid parameters' do
#       it 'creates a new group' do
#         user = create(:user) # Assuming you have a user factory set up with FactoryBot
#         sign_in user

#         group_params = attributes_for(:group)
#         post :create, params: { group: group_params }

#         expect(Group.count).to eq(1)
#         expect(response).to redirect_to(groups_path)
#         expect(flash[:notice]).to eq('Group was successfully created.')
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new group' do
#         user = create(:user)
#         sign_in user

#         group_params = attributes_for(:group, name: nil) # Assuming name is a required attribute
#         post :create, params: { group: group_params }

#         expect(Group.count).to eq(0)
#         expect(response).to render_template(:new)
#         expect(flash[:alert]).to be_present
#       end
#     end
#   end
# end
