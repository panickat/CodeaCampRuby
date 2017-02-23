module UserSeeds
  def self.import(filename=File.dirname(__FILE__) + "/../users.csv")
    field_names = nil

    User.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          begin
          attribute_hash = Hash[field_names.zip(data)]
          user = User.create!(attribute_hash)
          rescue ActiveRecord::RecordInvalid => e
            attribute_hash[:errs] = e.record.errors.details.keys.to_s
            Uerr.create!(attribute_hash)
          end
        end

      end # open
    end # transaction



  end # def
end # module
