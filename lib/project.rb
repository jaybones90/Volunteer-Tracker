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
      if project.id == id
        return project
      end
    end
  end



end
