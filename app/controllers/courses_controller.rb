class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.order(:created_at)
  end

  def show
    @lessons = @course.lessons.all
  end

  def new
    @course = Course.new
    redirect_to courses_path unless policy(@course).create?
  end

  def edit
    redirect_to courses_path unless policy(@course).update?
  end

  def create
    @course = current_user.courses.new(course_params)
    authorize @course
    if @course.save
      flash[:notice] = t('flash.success')
      redirect_to @course
    else
      render :new
    end
  end

  def update
    authorize @course
    if @course.update(course_params)
      flash[:notice] = t('flash.success')
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
    flash[:notice] = t('flash.destroyed')
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:user_id, :title, :description)
  end
end
