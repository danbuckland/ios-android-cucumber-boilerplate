# Step definitions for all steps that simply check which screen is displayed
Given(/^I am on the Home screen$/) do
  @screen.home.await
end
