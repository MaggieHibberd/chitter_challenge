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
    it 'hashes the password' do 
      expect(BCrypt::Password).to receive(:create).with('hibberd4eva')
      User.create(email: 'maggieh@gmail.com', username: 'magzimillion', password: 'hibberd4eva')
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
  describe '.authenticate' do 
    it 'returns a user given a correct username & password, if one does exist' do 
      user = User.create(email: 'test@example.com', password: 'password123', username: 'snot')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id 
    end
  end
  describe '.authenticate' do 
    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'snot')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end 
    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'snot')

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end


