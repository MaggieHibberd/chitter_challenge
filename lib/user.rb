require 'bcrypt'

class User
  attr_reader :id, :email, :username, :password

  def initialize(id:, email:, username:, password:)
    @id = id
    @email = email
    @username = username
    @password = password
  end

  def self.create(email:, username:, password:)

    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    
    result = connection.exec("INSERT INTO users (email, username, password) VALUES('#{email}', '#{username}', '#{encrypted_password}') RETURNING id, email, username, password;")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id)
    return nil unless id

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'] )
  end
end
