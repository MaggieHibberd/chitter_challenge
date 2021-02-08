feature 'Viewing peep in chronological order' do 
  scenario 'Peeps are displayed in chronological order' do 
    connection = PG.connect(dbname: 'chitter_manager_test')

    connection.exec("INSERT INTO peeps (content, user_id, timestamp) VALUES ('Hello Arnie', '1', '2021-02-02 13:06:07.980079');")
    connection.exec("INSERT INTO peeps (content, user_id, timestamp)  VALUES ('Get to the chopper', '1', '2021-02-02 13:06:55.945688');")
    connection.exec("INSERT INTO peeps (content, user_id, timestamp)   VALUES ('Aint got time to bleed', '2', '2021-02-02 13:07:07.876132');")

    visit('/peeps')

    expect(page).to have_tag("ul:last-child", :text => '2021-02-02 13:07:07.876132')
    expect(page).to have_tag("ul:nth-last-child(2)", :text => '2021-02-02 13:06:55.945688')
    expect(page).to have_tag("ul:last-child", :text => '2021-02-02 13:06:07.980079')
  end 
end
