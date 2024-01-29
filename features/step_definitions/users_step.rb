Given("I am on the new user registration page") do
    visit new_user_path
  end
  
  When("I fill in the registration form with valid information") do
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Confirm Password", with: "password123"
  end
  
  When("I fill in the registration form with invalid information") do
    fill_in "Email", with: "test@example.com"
    # Leave out password fields to simulate invalid submission
  end
  
  And("I press the {string}") do |button_name|
    click_button button_name
  end
  
  Then("I should be redirected to the login page") do
    expect(current_path).to eq login_path
  end
  
  Then("I should be on the registration page") do
    expect(current_path).to eq users_path
  end
  
  Then("I should see a notice {string}") do |notice|
    expect(page).to have_content notice
  end
  
  Then("I should see error messages") do
    expect(page).to have_content "error"
  end
  