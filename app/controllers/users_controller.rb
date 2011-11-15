# This is a naive implementation of a user model,
# since our demo does not demonstrate authentication.

class UsersController < ApplicationController

  respond_to :json
  before_filter :require_user, :only => [:show, :update, :destroy]

  def index
    @users = User.all
    render :json => @users.map{ |u| u.default_json }
  end

  def show
    render :json => @user.default_json
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :json => @user.default_json
    else
      render :json => {:errors => @user.errors}, :status => :unprocessable_entity
    end
  end

  def update
   if @user.update_attributes(params[:user])
      render :json => @user.default_json
    else
      render :json => {:errors => @user.errors}, :status => :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
