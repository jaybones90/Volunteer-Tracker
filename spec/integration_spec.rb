require "capybara/rspec"
require "./app"
require "pry"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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
    click_link("Monkey")
    click_link("Edit This Project")
    fill_in("project_name", :with => "Potato")
    click_button("Submit")
    expect(page).to have_content("Potato")
  end
end
describe("the index page path for entering a new volunteer", {:type => :feature}) do
  it("lets the user create new volunteer") do
    visit('/')
    click_link("Volunteers")
    fill_in("name", :with => "Jason")
    click_button("Submit")
    click_link("Volunteers")
    expect(page).to have_content("Jason")
  end
end
describe("the index page path for entering a new volunteer", {:type => :feature}) do
  it("lets the user create new volunteer") do
    visit('/')
    click_link("Volunteers")
    fill_in("name", :with => "Jason")
    click_button("Submit")
    click_link("Volunteers")
    click_link("Jason")
    expect(page).to have_content("Add a project to this volunteer")
  end
end
