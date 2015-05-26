class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.upcoming.order(:date)
  end

  def show
  end

  def new
    @exam = Exam.new
    redirect_to exams_path unless policy(@exam).create?
  end

  def edit
    redirect_to exams_path unless policy(@exam).update?
  end

  def create
    @exam = current_user.exams.new(exam_params)
    authorize @exam
    if @exam.save
      flash[:notice] = t('flash.success')
      redirect_to @exam
    else
      render :new
    end
  end

  def update
    authorize @exam
    if @exam.update(exam_params)
      flash[:notice] = t('flash.success')
      redirect_to @exam
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path
    flash[:notice] = t('flash.destroyed')
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:title, :description, :date)
  end
end
