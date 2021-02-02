require 'pg'

feature 'View all peeps' do 
  scenario 'A user can view all peeps' do 
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peeps (content, user_id) VALUES ('Hello Arnie', '1');")
    connection.exec("INSERT INTO peeps (content, user_id)  VALUES ('Get to the chopper', '1');")
    connection.exec("INSERT INTO peeps (content, user_id)  VALUES ('Aint got time to bleed', '2');")

    visit('/peeps')

    expect(page).to have_content 'Hello Arnie'
    expect(page).to have_content 'Get to the chopper'
    expect(page).to have_content 'Aint got time to bleed'
  end 
end