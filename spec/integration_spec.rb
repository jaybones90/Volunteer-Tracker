require('spec_helper')

describe("the index page path for entering a new project", {:type => :feature}) do
  it("lets the user create new project") do
    visit('/')
    click_link("Projects")
    fill_in("Name Of Your Project", :with => "Monkey")
    click_button("Submit")
    expect(page).to have_content("Monkey")
  end
end
describe("the index page path for entering a new project", {:type => :feature}) do
  it("lets the user create new project") do
    visit('/')
    click_link("Projects")
    fill_in("Name Of Your Project", :with => "Monkey")
    click_button("Submit")
    click_link("Edit This Project")
    fill_in("Rename Your Project", :with => "Potato")
    expect(page).to have_content("Potato")
  end
end
describe("the index page path for entering a new volunteer", {:type => :feature}) do
  it("lets the user create new volunteer") do
    visit('/')
    click_link("Volunteers")
    fill_in("Enter Your Name", :with => "Jason")
    click_button("Submit")
    click_link("Volunteers")
    expect(page).to have_content("Jason")
  end
end
describe("the index page path for entering a new volunteer", {:type => :feature}) do
  it("lets the user create new volunteer") do
    visit('/')
    click_link("Volunteers")
    fill_in("Enter Your Name", :with => "Jason")
    click_button("Submit")
    click_link("Volunteers")
    click_link("Jason")
    expect(page).to have_content("Add A Project To This Volunteer")
  end
end
