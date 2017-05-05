describe(Volunteer) do
  describe('#name') do
    it('will return the name of the volunteer') do
      test_volunteer = Volunteer.new({:name => "Macho Man Randy Savage"})
      expect(test_volunteer.name).to(eq("Macho Man Randy Savage"))
    end
  end

  describe('#id') do
    it('will return the id of the volunteer') do
      test_volunteer = Volunteer.new({:id => 1})
      expect(test_volunteer.id).to(eq(1))
    end
  end

  describe('.all') do
    it('will return all of the volunteers but starts out empty') do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the volunteer to the database') do
      test_volunteer = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer.save
      expect(Volunteer.all).to(eq([test_volunteer]))
    end
  end

  describe('#==') do
    it('will return true if the volunteer name and class is the same') do
      test_volunteer1 = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer2.save
      expect(test_volunteer1 == test_volunteer2).to(eq(true))
    end
  end

  describe('.find') do
    it('find a specific volunteers based on its id') do
      test_volunteer1 = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => "Dennis Rodman"})
      test_volunteer2.save
      expect(Volunteer.find(test_volunteer1.id)).to(eq(test_volunteer1))
    end
  end

  describe('#update') do
    it('find a specific volunteers based on its id') do
      test_volunteer1 = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer1.save
      test_volunteer1.update({:name => "Dennis Rodman"})
      expect(test_volunteer1.name).to(eq("Dennis Rodman"))
    end
  end

  describe('#delete') do
    it('deletes a specific volunteer from the database') do
      test_volunteer1 = Volunteer.new({:name => "Macho Man Randy Savage"})
      test_volunteer1.save
      test_volunteer2 = Volunteer.new({:name => "Dennis Rodman"})
      test_volunteer2.save
      test_volunteer1.delete
      expect(Volunteer.all).to(eq([test_volunteer2]))
    end
  end

  describe('#add_project') do
    it('adds a project to a specific volunteer') do
      test_project = Project.new({:name => "Tiny Homes", :description => "Building tiny homes for the homeless"})
      test_project.save
      macho_man = Volunteer.new({:name => "Macho Man Randy Savage"})
      macho_man.save
      macho_man.add_project(test_project)
      expect(macho_man.project_id).to(eq(test_project.id))
    end
  end

end
