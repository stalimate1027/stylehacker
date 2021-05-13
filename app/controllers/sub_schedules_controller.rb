class SubSchedulesController < ApplicationController
  def index
  end

  def new
    @sub_schedule = SubSchedule.new
  end

  def create
    @sub_schedule = SubSchedule.new(sub_schedule_params)
    if @sub_schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def sub_schedule_params
    params.require(:sub_schedule).permit(:title, :date_id, :time_id, :text, :importance_id).merge(schedule_id: params[:schedule_id])
  end

end
