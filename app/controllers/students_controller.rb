class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    @student = Student.create(student_params)

    if @student.valid?
      redirect_to student_path(@student) # "/attendees/#{@attendee.id}"
    else
      flash[:messages] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  private

  def student_params
    # params.require(:student).permit(:first_name, :last_name)
    params.permit(:first_name, :last_name)
  end

  def set_student
    @student = Student.find(params[:id])
  end

end
