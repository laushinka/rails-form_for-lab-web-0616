require 'pry'
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student)
  end

  def show
    # binding.pry
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    @student.save
    redirect_to student_path(@student)
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
