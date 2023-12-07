require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(name: 'testuser', email: 'test@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    entity = Entity.new(name: 'Test Entity', amount: 100, author: user)
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity = Entity.new(amount: 100, author: user)
    expect(entity).to_not be_valid
  end

  it 'is not valid without an amount' do
    entity = Entity.new(name: 'Test Entity', author: user)
    expect(entity).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    entity = Entity.new(name: 'Test Entity', amount: 'abc', author: user)
    expect(entity).to_not be_valid
  end

  it 'is not valid with an amount less than 1' do
    entity = Entity.new(name: 'Test Entity', amount: 0, author: user)
    expect(entity).to_not be_valid
  end

  it 'belongs to an author (User)' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many groups' do
    association = described_class.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
  end
end
