class Volunteer

  attr_accessor(:id, :name)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def Volunteer.all
    volunteers = []
    found_volunteers = DB.exec("SELECT * FROM volunteers;")
    found_volunteers.each do |volunteer|
      name = volunteer['name']
      id = volunteer['id']
      volunteers.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id']
  end

  def == (another_volunteer)
    self.name == another_volunteer.name && self.class == another_volunteer.class
  end



end
