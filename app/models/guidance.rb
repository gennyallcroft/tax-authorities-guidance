require 'pg'

class Guidance

  attr_reader :country, :description, :url, :id

  def initialize(id:, country: , description:, url: )
    @id = id
    @country = country
    @description = description
    @url = url
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'guidance_test')
    else
      connection = PG.connect(dbname: 'guidance')
    end

    result = connection.exec("SELECT * FROM guidance;")
    result.map do |guidance|
      Guidance.new(id: guidance['id'], country: guidance['country'], description: guidance['description'], url: guidance['url'])
    end
  end

  def self.create(url: , country: , description: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'guidance_test')
    else
      connection = PG.connect(dbname: 'guidance')
    end

    result = connection.exec("INSERT INTO guidance (url, country, description) VALUES('#{url}', '#{country}', '#{description}') RETURNING id, url, country, description")
    Guidance.new(id: result[0]['id'], country: result[0]['country'], description: result[0]['description'], url: result[0]['url'])
  end
end
