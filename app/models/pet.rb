class Pet < ApplicationRecord
  belongs_to :client, required: false
  has_many :pet_histories , dependent: :destroy
end
