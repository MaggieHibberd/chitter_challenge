require 'peep'
require 'database_helpers'

describe Peep do 
  describe '.all' do 
    it 'returns all of the peeps' do 

      peep = Peep.create(content: 'Hello Arnie')
      Peep.create(content: 'Get to the chopper')
      Peep.create(content: 'Aint got time to bleed')
      
      peeps = Peep.all  

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.content).to eq 'Hello Arnie'
      expect(peeps.last.timestamp).to eq peep.timestamp
    end
  end 
  describe '.create' do 
    it 'creates a new peep' do 
      peep = Peep.create(content: 'And now we are here(10)')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'And now we are here(10)'
      expect(peep.timestamp).to eq persisted_data['timestamp']
      end
    end
end 

