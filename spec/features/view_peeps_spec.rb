feature 'View peeps' do
  scenario 'All peeps visible' do
    visit ('/peeps')

    expect(page).to have_content 'It was another uneventful day in Badger Falls'
    expect(page).to have_content 'Where the women are robust, the men are pink cheeked'
    expect(page).to have_content 'And the children are pink cheeked and robust'
  end
end
    