require('spec_helper')

describe(Project) do

  describe('#name') do
    it('will return the name of the project') do
      test_project = Project.new({:name => "Tiny Homes"})
      expect(test_project.name).to(eq("Tiny Homes"))
    end
  end

  describe('#description') do
    it('will return the description of the project') do
      test_project = Project.new({:description => "Building homes for the homeless"})
      expect(test_project.description).to(eq("Building homes for the homeless"))
    end
  end

  describe('#id') do
    it('will return the id of the project') do
      test_project = Project.new({:id => 1})
      expect(test_project.id).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the project to the database') do
      test_project = Project.new({:name => "Tiny Homes", :description => "Building tiny homes for the homeless"})
      test_project.save
      expect(Project.all).to(eq([test_project]))
    end
  end

  describe('.all') do
    it('returns all the saved projects but starts out empty') do
      expect(Project.all).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if the project name and description are the same') do
      test_project1 = Project.new({:name => "Tiny Homes", :description => "Building tiny homes for the homeless"})
      test_project1.save
      test_project2 = Project.new({:name => "Tiny Homes", :description => "Building tiny homes for the homeless"})
      test_project2.save
      expect(test_project1 == test_project2).to(eq(true))
    end
  end


end
