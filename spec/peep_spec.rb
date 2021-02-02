require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all of the peeps' do 
      connection = PG.connect(dbname: 'chitter_manager_test')

      # below may be of use when we add users
      # user1 = User.create(email: "maggieh@gmail.com", password: "oioi")

    
      connection.exec("INSERT INTO peeps (content, user_id) VALUES ('Hello Arnie', '1');")
      connection.exec("INSERT INTO peeps (content, user_id)  VALUES ('Get to the chopper', '1');")
      connection.exec("INSERT INTO peeps (content, user_id)  VALUES ('Aint got time to bleed', '2');")

      peep = Peep.all  

      expect(peep).to include('Hello Arnie')
      expect(peep).to include('Get to the chopper')
      expect(peep).to include('Aint got time to bleed')
    end
  end 
  describe '.create' do 
    it 'creates a new peep' do 
        Peep.create(content: 'And now we are here(10)')

        expect(Peep.all).to include 'And now we are here(10)'
      end
    end

end 

