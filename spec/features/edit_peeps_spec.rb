feature 'Edit Peeps' do
  scenario 'Change content of a Peep' do
    visit('/peeps')
    fill_in('content', with: 'New Peep')
    click_button('Post')
    first('.peep').click_button('Edit')
    fill_in('content', with: "Edited Peep")
    click_button('Repost')

    expect(page).to have_content 'Edited Peep'
  end
end 
