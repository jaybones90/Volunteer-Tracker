require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require './lib/project'
require './lib/volunteer'
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
  Project.new({:name => name, :description => description}).save
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



get('/volunteer/:id') do
  @all_projects = Project.all
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end

get ("/volunteer/:id/edit") do
  @volunteer = Volunteer.find(params['id'].to_i)
  erb(:edit_volunteer_form)
end

patch ("/volunteer/:id/edit") do
  volunteer = Volunteer.find(params['id'].to_i)
  name = params['name']
  volunteer.update({:name => name, :project_id => volunteer.project_id})
  redirect("/")
end



patch('/volunteer/:id/add_project') do
  @all_projects = Project.all
  project = Project.find(params.fetch('project_id'))
  volunteer = Volunteer.find(params['id'])
  volunteer.update(name: volunteer.name, project_id: project.id)
  redirect("/")
end

delete('/volunteer/:id/delete') do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteer.delete
  erb(:volunteer_delete)
end

##############################################################

get('/project/:id/add_volunteer') do
  @project = Project.find(params.fetch('id').to_i)
  @all_volunteers = Volunteer.all
  erb(:add_volunteer_form)
end

post('/volunteer/add') do
  name = params.fetch('name')
  Volunteer.new({:name => name}).save
  redirect('/')
end

get('/project/:id/volunteers') do
  @project = Project.find(params.fetch('id').to_i)
  @volunteers = @project.see_volunteers
  erb(:test)
end
