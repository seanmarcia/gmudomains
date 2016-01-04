class ImportJob
  require 'csv'
  include SuckerPunch::Job

  def perform(file)
    CSV.parse(file, encoding: "ISO-8859-1:UTF-8") do |row|
      Domain.find_or_create_by(domain: row[0]) do |domain|
        domain.record_type = row[1]
      end
    end
  end
end
