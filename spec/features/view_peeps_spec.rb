feature 'View peeps' do
  scenario 'All peeps visible' do
    connection = PG.connect(dbname: 'chitter2_test')
    connection.exec("INSERT INTO peeps (content) VALUES ('It was another uneventful day in Badger Falls');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Where the women are robust, the men are pink cheeked');")
    connection.exec("INSERT INTO peeps (content) VALUES ('And the children are pink cheeked and robust');")
    
    
    visit ('/peeps')


    expect(page).to have_content 'It was another uneventful day in Badger Falls'
    expect(page).to have_content 'Where the women are robust, the men are pink cheeked'
    expect(page).to have_content 'And the children are pink cheeked and robust'
  end
end
    