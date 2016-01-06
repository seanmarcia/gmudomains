namespace :domain_check do
  desc "Check Domain Validity"
  task :all => :environment do
    require 'nokogiri'
    require 'open-uri'

    Domain.all.each do |domain|
      begin
        url = 'http://' + domain.domain + '/'
        puts url
        response_data = open(url)
        response_url = response_data.base_uri.to_s
        resolves_to = response_url == url ? "SAME" : response_url
        response = response_data.status
        puts response_data.metas.inspect
        domain.response = response
        domain.resolves_to = resolves_to
        server = response_data.metas[:server]
        doc = Nokogiri::HTML(response_data)
        title = doc.css('title').inner_text
        puts title
        domain.title = title
      rescue StandardError => error
        puts error
        domain.response = error
      ensure
        domain.verified_at = DateTime.now()
        domain.save
      end

    end
  end
end
