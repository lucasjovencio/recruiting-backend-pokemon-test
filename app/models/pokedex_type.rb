class PokedexType < ApplicationRecord
	validates :pokedex_id, presence: true
	validates :type_id, presence: true

	belongs_to :pokedex
	belongs_to :type

	attr_accessor :name
	def attributes
		{
			'id' => @id,
			'type_id' => @type_id,
			'name' => nil
		}
	end
end
