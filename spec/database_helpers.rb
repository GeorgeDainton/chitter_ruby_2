require 'pg'

def persisted_data(content:)
  connection = PG.connect(dbname: 'chitter2_test')
  connection.query("SELECT * FROM peeps WHERE content = '#{content}';")
end