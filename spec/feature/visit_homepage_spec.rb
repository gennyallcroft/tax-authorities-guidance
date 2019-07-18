feature 'visit the homepage' do
  scenario 'user can visit the homepage' do
    visit '/'
    expect(page).to have_content 'Tax Authority Guidance'
  end
end
