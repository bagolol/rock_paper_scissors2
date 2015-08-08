Given(/^I am on the homepage "([^"]*)"$/) do |link|
  visit(link)
end

Then(/^I should see the "([^"]*)" element$/) do |element|
  page.has_css?(".#{element}")
end

When(/^I enter "([^"]*)"$/) do |name|
  fill_in("name", with: name)
end

When(/^I hit "([^"]*)"$/) do |move|
  click_on(move)
end

Then(/^I see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Given(/^I have submitted "([^"]*)" as my name$/) do|name|
  visit("/")
  fill_in("name", with: name)
  click_button("Computer")
end




