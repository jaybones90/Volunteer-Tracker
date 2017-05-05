class Volunteer

  attr_accessor(:id, :name)

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end


end
