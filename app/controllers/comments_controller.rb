class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to schedule_path(@comment.schedule.id)
    else
      @schedule = @comment.schedule
      @comments = @schedule.comments
      render "schedules/show"
    end
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end
end
