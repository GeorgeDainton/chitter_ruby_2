require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter2')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| peep['content']
    end 
  end 
end 