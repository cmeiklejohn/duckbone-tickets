class TicketsController < ApplicationController

  respond_to :json
  before_filter :require_ticket, :only => [:show, :update, :destroy]

  def index
    @tickets = Ticket.includes(:comments).includes(:owner).order("created_at DESC")
    @tickets = @tickets.where(:status => params[:status]) if params[:status]
    @tickets = @tickets.where(:kind => params[:kind]) if params[:kind]
    @tickets = @tickets.where("title LIKE ?", "%#{params[:q]}%") if params[:q]
    @tickets = @tickets.page params[:page] if params[:page]
    render :json => Duckbone::PageableCollection.new(@tickets)
  end

  def show
    render :json => @ticket
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      render :json => @ticket
    else
      render :json => {:errors => @ticket.errors}, :status => :unprocessable_entity
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      render :json => @ticket
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
