require 'peep'

describe '.all' do
  it 'shows all Peeps' do
    
    connection = PG.connect(dbname: 'chitter2_test')
    connection.exec("INSERT INTO peeps (content) VALUES ('It was another uneventful day in Badger Falls');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Where the women are robust, the men are pink cheeked');")
    connection.exec("INSERT INTO peeps (content) VALUES ('And the children are pink cheeked and robust');")
  
    peeps = Peep.all
    
    expect(peeps).to include('It was another uneventful day in Badger Falls')
    expect(peeps).to include('Where the women are robust, the men are pink cheeked')
    expect(peeps).to include('And the children are pink cheeked and robust')
  end
end 