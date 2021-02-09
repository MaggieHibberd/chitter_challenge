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
end







