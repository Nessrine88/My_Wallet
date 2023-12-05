class Entity < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
    has_many :groups, dependent: :destroy
    validates :name, :amount, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 1 }
     end
     