class Group < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :entities, foreign_key: 'group_id'

  # Validations
  validates :name, :icon, presence: true
end
