feature 'when user clicks a button they see a list of bookmarks' do
  scenario 'prints list of bookmarks' do
    visit ('/')
    expect(page).to have_content '[Google, Facebook, Hinge]'
  end
end
