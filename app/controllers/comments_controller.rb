class CommentsController < ApplicationController

  respond_to :json
  before_filter :require_ticket

  def create
    @comment = @ticket.comments.build(params[:comment])
    if @comment.save
      render :json => @comment
    else
      render :json => {:errors => @comment.errors}, :status => :unprocessable_entity
    end
  end

  def destroy
    @comment = @ticket.comments.find(params[:id])
    if @comment.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def require_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
