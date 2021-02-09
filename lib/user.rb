class User
  attr_reader :id, :email, :username, :password

  def initialize(id:, email:, username:, password:)
    @id = id
    @email = email
    @username = username
    @password = password
  end

  def self.create(email:, username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    
    result = connection.exec("INSERT INTO users (email, username, password) VALUES('#{email}', '#{username}', '#{password}') RETURNING id, email, username, password;")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end
end