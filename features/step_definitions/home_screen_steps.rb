
Given("I press on search icon") do
    find_element(id: "action_search").click
end

When("I type {string} in the search field") do |text|
    find_element(id: "search_src_text").send_keys(text)
end

When("I press return button on soft keyboard") do
    Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

Then(/^I can see "([^"]*)" as a current unit converter$/) do |current_unit|
    find_element(id: "action_bar_container").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

Then(/^Left unit picker value should be "([^"]*)"$/) do |value|
    actual_picker_text = find_elements(id: "select_unit_spinner")[0].text

    if actual_picker_text != value
        fail("Expected left unit picker value is #{value}, actual value is #{actual_picker_text}")
    end

end

Then(/^Right unit picker value should be "([^"]*)"$/) do |value|
    array_of_elements = find_elements(id: "select_unit_spinner")
    actual_picker_text = array_of_elements[1].text

    if actual_picker_text != value
      fail("Expected right unit picker value is #{value}, actual value is #{actual_picker_text}")
    end
end

Then(/^Show All button should be (enabled|disabled)$/) do |state|
    button_state = find_element(id: "btn_show_all").enabled?
    if state == "enabled"
        fail("Expected to be enabled") if button_state != true
    elsif state == "disabled"
        fail("Expected to be disabled") if button_state != false
    end
end

When("I press on Clear buttoon") do
    puts("I press on Clear buttoon")
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
    digits = target.split("")
    digits.each do |num|
        find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
    end
end

When("I press on switch units button") do
    find_element(id: "img_switch").click
end

Then(/^I should see result as "([^"]*)"$/) do |result|
    value = find_element(id: "target_value").text

    if value != result
        fail("expected value is #{result}, actual value is #{value}")
    end
end

Then(/^I select "([^"]*)" from left unit picker$/) do |value|
    find_elements(id: "select_unit_spinner")[0].click
    find_in_list(value)
end

Then(/^I select "([^"]*)" from menu$/) do |value|
    text(value).click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |value|
    find_elements(id: "select_unit_spinner")[1].click
    find_in_list(value)
end

Then("I should see text {string}") do |value|
    text(value)
end
  
Then(/^I can verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
    parent_element = find_element(id: "history_conversion_list")
    array_of_elements = parent_element.find_elements(id: "history_single_line")
    actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
    if actual_text != text
        fail("Expected text is #{text}, actual text is #{actual_text}")
    end
end

When(/^I press delete from history at (\d+)(?:st|nd|rd|th)? row$/) do |index|
    parent_element = find_element(id: "history_conversion_list")
    array_of_elements = parent_element.find_elements(id: "history_single_line")
    array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end
