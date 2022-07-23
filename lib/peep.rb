require 'pg'

class Peep

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end 


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id]'], content: peep['content'], time: peep['time'])
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end 
end 