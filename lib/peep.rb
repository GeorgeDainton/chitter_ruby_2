require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    result = connection.exec("SELECT * FROM peeps;")
    result.map{|peep| peep['content']} 
  end

  def self.new(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end 

    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end 
end 