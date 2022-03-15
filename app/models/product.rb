class Product < ApplicationRecord
    has_many :comments, dependent: :delete
end
