class CommentsController < ApplicationController
  def create
    comment = Comment.create(content: params[:content], user: User.find(params[:user_id]), event: Event.find(params[:event_id]))
    if comment.valid?
      redirect_to "/events/#{params[:event_id]}", alert: "Comment has been created"
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to "/events/#{params[:event_id]}"
    end
  end
end
