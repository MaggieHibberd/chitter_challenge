feature 'authentication' do 
  it 'a user can sign in' do 
    User.create(email: 'test@example.com', password: 'password123', username: 'snot')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
   
    click_button('Sign in')

    expect(page).to have_content 'Welcome, snot!'
  end 
  it 'a user is shown a flash message if login was unsuccessful' do 
    User.create(email: 'test@example.com', password: 'password123', username: 'snot')

    visit '/sessions/new'
    fill_in(:email, with: 'tet@example.com')
    fill_in(:password, with: 'password123')
   
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, snot!'
    expect(page).to have_content 'Check your blooming email or password!'
  end 
  it 'a user sees an error message if they enter the wrong password' do
    User.create(email: 'test@example.com', password: 'password123', username: 'snot')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
 
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, snot!'
    expect(page).to have_content 'Check your blooming email or password!'
  end
  scenario 'a user can sign out' do 
    User.create(email: 'test@example.com', password: 'password123', username: 'snot')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    
    click_button('Sign in')

    click_button('SIGN OUT')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end 
end 
