class Project

  attr_accessor(:id, :name, :description)

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
  end

  def Project.all
    []
  end




end
