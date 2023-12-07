class Entity < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    belongs_to :group, foreign_key: true
    validates :name, :amount, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 1 }
     end
     