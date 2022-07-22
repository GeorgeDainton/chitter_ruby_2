require 'peep'

describe '.all' do
  it 'shows all Peeps' do
    peeps = Peep.all
    

    expect(peeps).to include('It was another uneventful day in Badger Falls')
    expect(peeps).to include('Where the women are robust, the men are pink cheeked')
    expect(peeps).to include('And the children are pink cheeked and robust')
  end
end 