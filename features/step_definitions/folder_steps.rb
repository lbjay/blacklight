Then /^I should see an add to folder form for ckey "([^\"]*)"$/ do |arg1|
  response.should have_tag("input#submitFolderForm_#{arg1}")
end

When /^I add ckey "([^\"]*)" to my folder$/ do |arg1|
  click_button("submitFolderForm_#{arg1}")
end

Given /^I have ckey "([^\"]*)" in my folder$/ do |arg1|
  visit catalog_path(arg1)
  click_button("submitFolderForm_#{arg1}")
  click_link("Marked List")
end
Given /^that I have cleared my folder$/ do
  click_link("Marked List")
  click_link("Clear Marked List")
end
Then /^I should not get "([^\"]*)" in the marked list$/ do |arg1|
  visit("/folder")
  response.body.should_not  contain(arg1)
end
