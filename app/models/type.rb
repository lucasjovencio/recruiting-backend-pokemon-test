
class Type < ApplicationRecord
    validates :name, presence: true
    validates_with NameJsonValidator

    def to_json(options={})
        options[:except] ||= [:created_at,:updated_at]
        super(options)
    end

end
