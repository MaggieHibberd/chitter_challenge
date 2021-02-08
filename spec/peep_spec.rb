require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all of the peeps' do 
      # connection = PG.connect(dbname: 'chitter_manager_test')

      # below may be of use when we add users
      # user1 = User.create(email: "maggieh@gmail.com", password: "oioi")

    
      # connection.exec("INSERT INTO peeps (content, user_id, timestamp) VALUES ('Hello Arnie', '1', '2021-02-02 13:06:07.980079');")
      # connection.exec("INSERT INTO peeps (content, user_id, timestamp)  VALUES ('Get to the chopper', '1', '2021-02-02 13:06:55.945688');")
      # connection.exec("INSERT INTO peeps (content, user_id, timestamp)   VALUES ('Aint got time to bleed', '2', '2021-02-02 13:07:07.876132');")
      Peep.create("INSERT INTO peeps (, , ) VALUES (content: 'Hello Arnie', user_id: '1', timestamp:'2021-02-02 13:06:07.980079');")
      # Peep.create("INSERT INTO peeps (content, user_id, timestamp)  VALUES ('Get to the chopper', '1', '2021-02-02 13:06:55.945688');")
      Peep.create("INSERT INTO peeps (content, user_id, timestamp)   VALUES ('Aint got time to bleed', '2', '2021-02-02 13:07:07.876132');")

      peep = Peep.all  

      expect(peep).to include('Hello Arnie', '2021-02-02 13:06:07.980079')
      expect(peep).to include('Get to the chopper', '2021-02-02 13:06:55.945688')
      expect(peep).to include('Aint got time to bleed', '2021-02-02 13:07:07.876132')
    end
  end 
  describe '.create' do 
    it 'creates a new peep' do 
        Peep.create(content: 'And now we are here(10)')

        expect(Peep.all).to include 'And now we are here(10)'
      end
    end

end 

