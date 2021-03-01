require 'pg'

class Peep 

  attr_reader :id, :content, :timestamp

  def initialize(id:, content:, timestamp:)
    @id = id
    @content = content
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], timestamp: peep['timestamp'])
    end
  end 

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
  
    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') RETURNING content, id, timestamp;")
    Peep.new(content: result[0]['content'], id: result[0]['id'], timestamp: result[0]['timestamp'])
  end
end
