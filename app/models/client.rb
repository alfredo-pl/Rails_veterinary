class Client < ApplicationRecord
    has_many :pets , dependent: :destroy

    def get_pets
        Pet.references(:clients).where(client_id: id).count
    end
    def get_pet_name
        Pet.references(:clients).where(client_id: id).pluck :name
    end
    def get_pet_max_w
        no = "0"
        max =   Pet.references(:clients).where(client_id: id).pluck :weight
        if max.blank?
            no
        else
            max.max
        end
    end
    def get_pet_max_h
        no = "0"
        max =   Pet.references(:clients).where(client_id: id).pluck :height
        if max.blank?
            no
        else
            max.max
        end
    end
end
