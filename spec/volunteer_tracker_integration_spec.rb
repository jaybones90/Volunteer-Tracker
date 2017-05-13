require 'spec_helper'

describe("the index page path for entering a new project", {:type => :feature}) do
  it("lets the user create new project") do
    visit("/")
    click_link("Projects")
    fill_in("Name Of Your Project", :with => "Monkey")
    click_button("Submit")
    expect(page).to have_content("Monkey")
  end
end
