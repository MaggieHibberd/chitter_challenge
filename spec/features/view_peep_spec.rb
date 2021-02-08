require 'pg'

feature 'View all peeps' do 
  scenario 'A user can view all peeps' do 
    
    Peep.create(content: 'Hello Arnie')
    Peep.create(content: 'Get to the chopper')
    Peep.create(content: 'Aint got time to bleed')

    visit('/peeps')

    expect(page).to have_content 'Hello Arnie'
    expect(page).to have_content 'Get to the chopper'
    expect(page).to have_content 'Aint got time to bleed'
  end 
end