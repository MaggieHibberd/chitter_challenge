require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all of the peeps' do 
      peep = Peep.all  

      expect(peep).to include('Hello Arnie')
      expect(peep).to include('Get to the chopper')
      expect(peep).to include('Aint got time to bleed')
    end
  end 
end 
