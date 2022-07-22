feature 'View homepage' do
  scenario 'shows list of peeps' do
    visit ('/')

    expect(page).to have_content "It's Morbin' Time"
  end
end


