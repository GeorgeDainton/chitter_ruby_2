feature 'View peeps' do
  scenario 'All peeps visible' do
    visit('/peeps')
    fill_in('content', with: 'New Peep')
    click_button('Submit')

    expect(page).to have_content 'New Peep'
  end
end 
