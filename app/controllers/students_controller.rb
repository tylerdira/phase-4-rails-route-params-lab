class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name]
      filtered_students = students.filter do |student|
        student.first_name.downcase == params[:name] || student.last_name.downcase == params[:name]
      end
  
      render json: filtered_students
    else
      render json: students
    end
    
    
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
