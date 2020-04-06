class Pokedex < ApplicationRecord 
    validates :name, presence: true
    validates :hp, presence: true
    validates :attack, presence: true
    validates :defense, presence: true
    validates :speed_attack, presence: true
    validates :speed_defense, presence: true
    validates :speed, presence: true
    validates_with NameJsonValidator
    
    has_many :pokedexType, dependent: :destroy
    has_one_attached:image, dependent: :destroy
    has_one_attached:sprite, dependent: :destroy
    has_one_attached:thumbnail, dependent: :destroy

    attr_accessor :pokedex_type
    def attributes
        {
            'id' => @id,
            'name' => @name,
            'hp' => @hp,
            'attack' => @attack,
            'defense' => @defense,
            'speed_attack' => @speed_attack,
            'speed_defense' => @speed_defense,
            'speed' => @speed,
            'pokedex_type' => nil
        }
    end
 
    
end
