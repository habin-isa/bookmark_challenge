feature 'when user clicks a button they see a list of bookmarks' do
  scenario 'adds a url to the page' do
    connection = PG.connect(dbname:'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks(url) VALUES('https://www.spareroom.co.uk/')")
    visit ('/bookmarks')
    expect(page).to have_content "https://www.spareroom.co.uk/"
  end
end
