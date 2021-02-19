require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'maggieh@gmail.com', username: 'magzimillion', password: 'hibberd4eva')
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq persisted_data['email']
      expect(user.username).to eq persisted_data['username']

    end
  end
  describe '.find' do 
    it 'finds a user by ID' do 
      user = User.create(email: 'maggieh@gmail.com', username: 'magzimillion', password: 'hibberd4eva')

      result = User.find(user.id)
    
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.username).to eq user.username

    end 
    it 'returns nil if there is no ID given' do   
      expect(User.find(nil)).to eq nil 
    end
  end
end


