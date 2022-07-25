feature 'Add Peeps' do
  scenario 'Add new Peep' do
    visit('/peeps')
    fill_in('content', with: 'New Peep')
    click_button('Post')

    expect(page).to have_content 'New Peep'
  end
end 
