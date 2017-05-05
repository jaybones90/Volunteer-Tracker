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
end
