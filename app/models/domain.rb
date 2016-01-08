class Domain < ActiveRecord::Base

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |domain|
        csv << domain.attributes.values_at(*column_names)
      end
    end
  end

end
