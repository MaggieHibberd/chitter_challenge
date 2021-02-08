feature 'Viewing peep in chronological order' do 
  scenario 'Peeps are displayed in chronological order' do 

    Peep.create(content: 'Hello Arnie')
    Peep.create(content: 'Get to the chopper')
    Peep.create(content: 'Aint got time to bleed')

    peeps = Peep.all


    # [{content: 'hello arnie', timestamp: '22:05'}, {content: 'hello arnie', timestamp: '22:05'}, {content: 'hello arnie', timestamp: '22:05'}]

    # first_peep = peeps.first[:timestamp]

    visit('/peeps')

    expect(page).to have_tag("ul:last-child", :text => "2021-02-02 13:06:55.945688")
    expect(page).to have_tag("ul:nth-last-child(2)", :text => '2021-02-02 13:06:55.945688')
    expect(page).to have_tag("ul:last-child", :text => '2021-02-02 13:06:07.980079')
  end 
end
