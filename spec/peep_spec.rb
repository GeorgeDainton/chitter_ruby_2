require 'peep'
require 'database_helpers'
require 'timecop'

describe '.all' do

  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  it 'shows all Peeps' do
    connection = PG.connect(dbname: 'chitter2_test')
    
    peep = Peep.create(content: 'It was another uneventful day in Badger Falls')
    Peep.create(content: 'Where the women are robust, the men are pink cheeked')
    Peep.create(content: 'And the children are pink cheeked and robust')
  
    peeps = Peep.all
    
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.content).to eq 'It was another uneventful day in Badger Falls'
    expect(peeps.first.time).to eq Time.now.round.strftime('%Y-%m-%d %H:%M:%S')

  end
end

describe '.create' do

  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  it 'creates a new Peep' do
  peep = Peep.create(content: "At the Apple Biscuit cafe, where the smiles are free, dont you know, Sven Inquist studied the menu, and finally, he ordered the same thing he has every day.")
  persisted_data = persisted_data(content: peep.content)
  
  expect(peep).to be_a Peep
  expect(peep.content).to eq persisted_data.first['content']
  expect(peep.content).to eq "At the Apple Biscuit cafe, where the smiles are free, dont you know, Sven Inquist studied the menu, and finally, he ordered the same thing he has every day."
  expect(peep.time).to eq Time.now.round.strftime('%Y-%m-%d %H:%M:%S')
  end

  describe '.delete' do
    it 'deletes the given peep' do
      peep = Peep.create(content: 'Makers Academy')
  
      Peep.delete(id: peep.id)
  
      expect(Peep.all.length).to eq 0
    end
  end

  describe '.edit' do
    it 'updates a peep' do
      peep = Peep.create(content: 'I ated the purple berries')
      edited_peep = Peep.edit(id: peep.id, content: 'They taste like burning')

      expect(edited_peep.content).to eq 'They taste like burning'
    end
  end
  
  describe '.find' do
    it 'locates a specific Peep' do
      peep = Peep.create(content: 'Where this one at')
      found_peep = Peep.find(id: peep.id)

      expect(peep.content).to eq 'Where this one at'
    end
  end 
end