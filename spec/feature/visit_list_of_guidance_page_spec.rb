
feature 'view page for list of guidance' do
  scenario 'user can view the page for the list of links to guidance' do
    visit '/'
    click_on 'VIEW GUIDANCE'
    expect(page).to have_content 'Click on a link below to view the VAT guidance available in that country'
  end
end
