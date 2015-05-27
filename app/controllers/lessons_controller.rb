class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def show
    @comments = Comment.for_lesson(@lesson.id)
    @comment = Comment.new
  end

  def new
    @lesson = Lesson.new
    redirect_to courses_path unless policy(@lesson).create?
  end

  def edit
    redirect_to courses_path unless policy(@lesson).update?
  end

  def create
    @lesson = current_user.lessons.new(lesson_params)
    authorize @lesson
    if @lesson.save
      flash[:notice] = t('flash.success')
      redirect_to @lesson
    else
      render :new
    end
  end

  def update
    authorize @lesson
    if @lesson.update(lesson_params)
      flash[:notice] = t('flash.success')
      redirect_to @lesson
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
    flash[:notice] = t('flash.destroyed')
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:course_id, :title,
                                   :description, :video,
                                   :video_cache,
                                   :remove_video)
  end
end
