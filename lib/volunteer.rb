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

  def Volunteer.find (id)
    Volunteer.all.each do |volunteer|
      if volunteer.id = id
        return volunteer
      end
    end
  end

  def update (attributes)
    @name = attributes[:name]
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end




end
