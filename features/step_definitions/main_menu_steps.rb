Given("I land on Home screen") do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

Given("I press on Add to Favorite icon") do
  find_element(id: "action_add_favorites").click
end

When("I press on Favorite conversion") do
  text("Favorite conversions").click
end

When("I press on Menu icon") do
  find_element(accessibility_id: "Open navigation drawer").click
end

When("I press on My conversions button") do
  text("My conversions").click
end

Then("I land on My conversions screen") do
  text("No personal conversion created yet")
end

Then("I should see left side menu") do
  text("Unit Converter")
end

Then("I can verify that {string} was added to Favorite converstion list") do |unit_type|
  item_text = find_element(id: "favorites_item_hint").text
  if unit_type != item_text
    fail("Cannot find #{unit_type} in Favorite list")
  end
end