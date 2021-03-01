feature 'Viewing peep in chronological order' do 
  scenario 'Peeps are displayed in chronological order' do 

    peep_one = Peep.create(content: 'Hello Arnie')
    peep_two = Peep.create(content: 'Get to the chopper')
    peep_three = Peep.create(content: 'Aint got time to bleed')
    
    visit('/peeps')

    expect(page).to have_selector("ul li:nth-child(3)", text: peep_one.timestamp)
    expect(page).to have_selector("ul li:nth-child(2)", text: peep_two.timestamp)
    expect(page).to have_selector("ul li:nth-child(1)", text: peep_three.timestamp)
  end 
end
