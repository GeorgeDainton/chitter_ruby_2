feature 'Delete Peeps' do
  scenario 'Deletes a Peep' do
    visit('/peeps')
    fill_in('content', with: 'New Peep')
    click_button('Post')
    click_button('Delete')

    expect(page).to have_no_content 'New Peep'
  end
end 
