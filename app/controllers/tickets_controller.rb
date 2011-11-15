class TicketsController < ApplicationController

  respond_to :json
  before_filter :require_ticket, :only => [:show, :update, :destroy]

  def index
    @tickets = Ticket.includes(:comments).includes(:owner).all
    render :json => @tickets.map{ |t| t.default_json }
  end

  def show
    render :json => @ticket.default_json
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      render :json => @ticket.default_json
    else
      render :json => {:errors => @ticket.errors}, :status => :unprocessable_entity
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      render :json => @ticket.default_json
    else
      render :json => {:errors => @ticket.errors}, :status => :unprocessable_entity
    end
  end

  def destroy
    if @ticket.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def require_ticket
    @ticket = Ticket.find(params[:id])
  end

end
