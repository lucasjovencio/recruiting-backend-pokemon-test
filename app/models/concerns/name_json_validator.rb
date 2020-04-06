require 'json'
class NameJsonValidator < ActiveModel::Validator
    def validate(record)
        json_valid = JsonWebToken.valid?(record.name.to_json)
        if(json_valid == false)
            record.errors.add(:name, "has don't have json")
        end

        if json_valid
            valid = 0
            record.name.keys.each do |key|
                if(record.name["#{key}"] != '' && record.name["#{key}"] != nil)
                    valid = 1
                end
            end

            if (valid == 0)
                record.errors.add(:name, "can't be blank")
            end
        end
    end
end