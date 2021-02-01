feature 'View all peeps' do 
  scenario 'A user can view all peeps' do 
    visit('/peeps')

    expect(page).to have_content 'Hello Arnie'
    expect(page).to have_content 'Get to the chopper'
    expect(page).to have_content 'Aint got time to bleed'
  end 
end