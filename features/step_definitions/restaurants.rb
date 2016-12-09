# -- reset the session at the begining of run --
page ||= Capybara.current_session

# *********************************************************
# ************************  GIVEN  *************************
# *********************************************************
Given(/^user goes to the main page$/) do
  page.visit '/'
end

Given (/^The system clears session before run/) do
  page.reset!
end

# *********************************************************
# ************************  WHEN  *************************
# *********************************************************
When /^user fills the Find box with "(.*?)" keyword$/ do |value|
  page.find(:id, IDs.text_fields['Find field']).set(value)
end

When /^user fills the Near box with "(.*?)" keyword$/ do |value|
  page.find(:id, IDs.text_fields['Near field']).set(value)
end

When(/^user waits (\d+) second$/) do |time|
  sleep time.to_i
end

When(/^user clicks on the "(.*?)" button$/) do |button|
  wait_until do
    page.find(:id, IDs.buttons[button]).click
  end
end

When(/^user applies the filters by: Neighborhoods, Price, Features and Category$/) do
  page.find(:css, IDs.all_filters).click()
  page.find(:xpath, IDs.neighborhoods).click()
  sleep 3.to_i
  page.find(:xpath, IDs.price).click()
  sleep 3.to_i
  page.find(:xpath, IDs.category).click()
  sleep 2.to_i
  page.find(:xpath, IDs.features).click()
  sleep 2.to_i
end

When(/^I uncheck Order Pickup or Delivery checkbox$/) do
  page.find(:css, IDs.pickup_check).click()
end

When(/^user should see TOTAL report no. of Search results with no. of results in the current page$/) do
  text = find(:css, IDs.search_result).text
  text.should == "Showing 1-3 of 3"
end

When(/^user expands the first element from the search result page$/) do
  page.first(:css, IDs.first_element_of_search_page).click()
end

# *********************************************************
# ************************  THEN  *************************
# *********************************************************
Then(/^user should see "(.*?)"$/) do |text|
  page.has_content?(text)
end

Then(/^user should see report of TOTAL no. of Search results shown$/) do
  text = find(:css, IDs.search_result).text
  text.include? "7996"
end

Then(/^user should see report of TOTAL no. of results on the current page shown$/) do
  text = find(:css, IDs.search_result).text
  text.include? "1-10"
end

Then(/^user should be able to save all critical information for the reporting purposes$/) do
  page.save_screenshot('Amber_India.png')
  page.save_and_open_page('Amber_India.html')
end
