class Type < ApplicationRecord
    validates :name, presence: true
    
    def to_json(options={})
        options[:except] ||= [:created_at,:updated_at]
        super(options)
    end

end
