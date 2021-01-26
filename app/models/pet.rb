class Pet < ApplicationRecord
  validates :name, :race, :birthdate, presence: true
  belongs_to :client, required: false
  has_many :pet_histories , dependent: :destroy

  def get_visits
    PetHistory.references(:pets).where(pet_id: id).count
  end

  def get_average_w
    no = "0"
    max = PetHistory.references(:pets).where(pet_id: id).pluck :weight
    cant = max.size
    if max.blank?
        no
    else
        max.sum/cant
    end 
  end
  def get_average_h
    no = "0"
    max = PetHistory.references(:pets).where(pet_id: id).pluck :height
    cant = max.size
    if max.blank?
        no
    else
        max.sum/cant
    end 
  end
  def get_max_w
    no = "0"
        max = PetHistory.references(:pets).where(pet_id: id).pluck :weight
        if max.blank?
            no
        else
            max.max
        end
  end
  def get_max_h
    no = "0"
    max = PetHistory.references(:pets).where(pet_id: id).pluck :height
    if max.blank?
        no
    else
        max.max
    end
  end
  
end
