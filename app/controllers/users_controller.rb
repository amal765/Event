class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @q = Event.search(params[:q])
    @events = @user.events
  end

  def destroy
  end
end
