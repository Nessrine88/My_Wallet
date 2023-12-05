class Group < ApplicationRecord
    belongs_to :user
    has_many :entities
    belongs_to :users, foreign_key: 'user_id'
    
    validates :name, presence: true
  end
  