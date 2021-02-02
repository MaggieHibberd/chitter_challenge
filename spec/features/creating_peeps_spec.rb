feature 'Adding a new peep' do 
  scenario 'A user can create a new peep' do 
    visit('/peeps/new')
    fill_in('content', with: 'May the force be with you' )
    click_button('PEEP')

    expect(page).to have_content 'May the force be with you'
  end 
end