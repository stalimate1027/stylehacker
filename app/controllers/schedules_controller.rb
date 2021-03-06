class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all.order("created_at DESC")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to root_path
  end

  def show
    @schedule = Schedule.find(params[:id])
    @sub_schedule = SubSchedule.new
    @sub_schedule = SubSchedule.find_by(params[@sub_schedule.id])
    @sub_schedule = SubSchedule.where(params[:id])
    @comment = Comment.new
    @comment = @schedule.comments.includes(:user)
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to schedule_path
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :date_id, :time_id, :text, :importance_id).merge(user_id: current_user.id)
  end
end
