class Project

  attr_accessor(:id, :name, :description)

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
  end

  def Project.all
    projects = []
    found_projects = DB.exec("SELECT * FROM projects;")
    found_projects.each do |project|
      name = project['name']
      description = project['description']
      id = project['id'].to_i
      projects.push(Project.new({:name => name, :description => description, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (name, description) VALUES ('#{@name}', '#{@description}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == (another_project)
    self.name == another_project.name && self.description == another_project.description
  end

  def Project.find (id)
    Project.all.each do |project|
      if project.id == id.to_i
        return project
      end
    end
  end

  def update (attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{self.id};")
    DB.exec("UPDATE projects SET description = '#{@description}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
  end

  def see_volunteers
    project_volunteers = []
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    results.each do |result|
      id = result.fetch('id').to_i
      name = result.fetch('name')
      project_id = result.fetch('project_id')
      project_volunteers.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
    project_volunteers
  end

end
