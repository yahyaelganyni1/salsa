class Card < ApplicationRecord
  has_many :products
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
end
