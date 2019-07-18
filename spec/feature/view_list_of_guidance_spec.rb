feature 'user can view a list of country VAT guidance' do
  scenario 'user can see list of countries' do
    visit '/'
    click_on 'VIEW GUIDANCE'
    expect(page).to have_content'UK'
  end
end
