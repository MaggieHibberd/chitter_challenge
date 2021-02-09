feature 'users can sign up' do
  scenario 'user can submit their details in a form' do
    visit('/users/new')


    fill_in 'email', with: 'maggieh@gmail.com'
    fill_in 'username', with: 'magzimillion'
    fill_in 'password', with: 'hibberd4eva'

    click_button 'REGISTER'
  
    expect(page).to have_content 'Welcome, magzimillion!'

  end
end