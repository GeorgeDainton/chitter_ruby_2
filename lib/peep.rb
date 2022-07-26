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
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    result = connection.exec_params(
    "INSERT INTO peeps (content) VALUES($1) RETURNING id, content, time;", [content])
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    connection.exec_params("DELETE FROM peeps WHERE id = $1", [id])
  end

  def self.edit(id:, content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    result = connection.exec_params("UPDATE peeps SET content = $1 WHERE id = $2 RETURNING id, content, time;", [content, id]
    )
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end 


end 