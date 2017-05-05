class Volunteer

  attr_accessor(:id, :name, :project_id)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  def Volunteer.all
    volunteers = []
    found_volunteers = DB.exec("SELECT * FROM volunteers;")
    found_volunteers.each do |volunteer|
      name = volunteer['name']
      id = volunteer['id']
      project_id = volunteer['project_id']
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
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

  def add_project (project)
    found_project = DB.exec("SELECT * FROM projects WHERE id = #{project.id};")
    @project_id = found_project.first['id'].to_i
    DB.exec("UPDATE volunteers SET project_id = #{@project_id} WHERE id = #{self.id};")
  end



end
