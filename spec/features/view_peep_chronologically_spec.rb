feature 'Viewing peep in chronological order' do 
  scenario 'Peeps are displayed in chronological order' do 

    peep_one = Peep.create(content: 'Hello Arnie')
    peep_two = Peep.create(content: 'Get to the chopper')
    peep_three = Peep.create(content: 'Aint got time to bleed')
    
    visit('/peeps')

    expect(page).to have_selector("ul li:nth-child(3)", text:  Time.parse(peep_one.timestamp).strftime("Peeped on %m/%d/%Y"))
    expect(page).to have_selector("ul li:nth-child(2)", text:  Time.parse(peep_two.timestamp).strftime("Peeped on %m/%d/%Y"))
    expect(page).to have_selector("ul li:nth-child(1)", text:  Time.parse(peep_three.timestamp).strftime("Peeped on %m/%d/%Y"))
  end 
end
