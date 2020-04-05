class RepositoryType
    
    class << self
        def register(params)
            Type.create(params)
        end

        def find_by_name_english(param)
            Type.where("json_extract(name, '$.english') = :text", text: param).take
        end

    end
end