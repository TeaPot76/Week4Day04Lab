require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')


require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

#INDEX
get '/students' do
  @students = Student.all()
  erb ( :index )
end

#NEW
get'/students/new' do
   @array_of_house_names = House.all_house_names()
  erb(:new)
end

#SHOW
get '/students/:id' do
  @student = Student.find_by_id(params[:id])
  erb(:show)
end


#CREATE
post '/students' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

#EDIT
get '/students/:id/edit' do
  @student = Student.find_by_id(params[:id])
  erb(:edit)
end

#UPDATE
post '/students/:id' do
  Student.new(params).update
  redirect to '/students'
end

#DELETE
post '/students/:id/delete' do
  student = Student.find_by_id(params[:id])
  student.delete
  redirect to '/students'
end
