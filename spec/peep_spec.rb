require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all of the peeps' do 
      # below may be of use when we add users
      # user1 = User.create(email: "maggieh@gmail.com", password: "oioi")

      peep = Peep.create(content: 'Hello Arnie')
      Peep.create(content: 'Get to the chopper')
      Peep.create(content: 'Aint got time to bleed')
      
      peeps = Peep.all  

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Hello Arnie'
      expect(peeps.first.timestamp).to eq peep.timestamp
    end
  end 
  describe '.create' do 
    it 'creates a new peep' do 
        peep = Peep.create(content: 'And now we are here(10)')
        persisted_data = PG.connect(dbname: 'chitter_manager_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

        expect(peep).to be_a Peep
        expect(peep.id).to eq persisted_data.first['id']
        expect(peep.content).to eq 'And now we are here(10)'
        expect(peep.timestamp).to eq persisted_data.first['timestamp']
      end
    end
end 

