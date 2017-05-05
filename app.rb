require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pry'
require 'pg'
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @all_projects = Project.all
  erb(:index)
end

##############################################################

get('/projects') do
  @all_projects = Project.all
  erb(:projects)
end

post('/projects/new') do
  name = params.fetch('project_name')
  description = params.fetch('project_description')
  new_project = Project.new({:name => name, :description => description}).save
  @all_projects = Project.all
  erb(:index)
end

##############################################################

get('/project/:id') do
  @project = Project.find(params.fetch('id').to_i)
  erb(:project)
end

get('/project/:id/edit') do
  @project = Project.find(params.fetch('id').to_i)
  erb(:edit_project_form)
end

patch('/project/:id/edit') do
  name = params.fetch('project_name')
  description = params.fetch('project_description')
  @project = Project.find(params.fetch('id').to_i)
  @project.update({:name => name, :description => description})
  erb(:project)
end

delete('/project/:id') do
  @project = Project.find(params.fetch('id').to_i)
  @project.delete
  @all_projects = Project.all
  erb(:index)
end


##############################################################

get('/volunteers') do
  @all_volunteers = Volunteer.all
  erb(:volunteers)
end

post('/volunteers/new') do
  name = params.fetch('name')
  new_volunteer = Volunteer.new({:name => name}).save
  @all_volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteer/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  erb(:volunteer)
end


##############################################################

get('/project/:id/add_volunteer') do
  @project = Project.find(params.fetch('id').to_i)
  @all_volunteers = Volunteer.all
  erb(:add_volunteer_form)
end

post('/project/:id/add_volunteer') do
  name = params.fetch('name')
  volunteer = Volunteer.new({:name => name}).save
  project = Project.find(params.fetch('id').to_i)

  volunteer.add_project(project)
  @all_projects = Project.all
  erb(:index)
end

get('/project/:id/volunteers') do
  @project = Project.find(params.fetch('id').to_i)
  @volunteers = @project.see_volunteers

  erb(:test)
end
