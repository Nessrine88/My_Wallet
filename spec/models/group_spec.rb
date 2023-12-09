# spec/models/group_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'testname', password: 'nessrine2019', email: 'macherki.nessrine@gmail.com') }
  it 'is valid with valid attribute' do
    group = Group.new(name: 'Test Group', icon: 'link_of_icon', author: user)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(icon: 'link_of_icon', author: user)
    expect(group).to_not be_valid
  end
  it 'is not valid without an icon' do
    group = Group.new(name: 'link_of_icon', author: user)
    expect(group).to_not be_valid
  end
  it 'belongs to an author (User)' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end
  it 'has many entities' do
    association = described_class.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
  end
end
