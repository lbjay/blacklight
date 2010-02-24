Then /^I should see an add to folder form for ckey "([^\"]*)"$/ do |arg1|
  response.should have_tag("div#Doc#{arg1} form.addFolderForm")
end

When /^I add ckey "([^\"]*)" to my folder$/ do |arg1|
  click_button("submitFolderForm_#{arg1}")
end

Given /^I have ckey "([^\"]*)" in my folder$/ do |arg1|
  visit catalog_path(arg1)
  click_button("Add to Marked List")
  click_link("Marked List")
end

Given /^I am logged in$/ do
  visit root_path
  click_link("Login using NetBadge")
end