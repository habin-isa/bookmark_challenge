feature 'when user clicks a button they see a list of bookmarks' do
  scenario 'adds a url to the page' do
    connection = PG.connect(dbname:'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks(url) VALUES('https://www.spareroom.co.uk/')")
    visit ('/')
    expect(page).to have_content "https://www.spareroom.co.uk/"
  end
end

feature 'when user submits url on form, should add the url to list' do
  scenario 'fills in form and prints postmanpat link' do
    visit('/')
    fill_in('url', :with => 'https://www.google.co.uk/')
    fill_in('title', :with => 'Google')
    click_button('submit')
    expect(page).to have_content("Google")
  end
end

feature 'checks that the user submits a valid url' do
  scenario 'fills in form with invalid url then raises an error' do
    visit('/')
    fill_in('url', :with => 'wrong link')
    click_button('submit')
    expect(page).to have_content("You must submit a valid URL.")
  end
  scenario 'fills in form with valid url and no error message' do
    visit('/')
    fill_in('url', :with => 'https://www.google.co.uk/')
    click_button('submit')
    expect(page).to have_no_content("You must submit a valid URL.")
  end
end

feature 'checks that user submits valid url and title' do
  scenario 'fills in form with valid url and title, both displayed' do
    visit('/')
    fill_in('url', :with => 'https://www.google.co.uk/')
    fill_in('title', :with => 'Google')
    click_button('submit')
    find_button('Google').click
    expect(page).to have_link('Google', href: 'https://www.google.co.uk/')
  end
end
