class EventsController < ApplicationController

  def index
    @event = Event.new
    @events = Event.all.where(status: true).page(params[:page]).per_page(2)
    @categories = Category.all
    @q = Event.search(params[:q])
    @user = current_user
  end

  def create
    @event = Event.create(event_params)
    @events = Event.all.where(status: true)
    respond_to do |format|
      format.js
    end
  end

  def show
    @search = Event.search(params[:q])
    @events = Event.all.where(status: true).limit(4).order("created_at DESC")
  end

  def edit
    @categories = Category.all
    @event = Event.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    respond_to do |format|
      if current_user.admin?
        @events = Event.all.where(status: true)
        format.js
      else
        @events = current_user.events
        format.js
      end
    end
  end

  def find_events
    @address = params[:q][:address]
    @events = Event.near(@address,100)
    respond_to do |format|
    format.js
    end
  end

  def category_events
    respond_to do |format|
      if params[:category_id] == '0'
        @events = Event.all.where(status: true)
        format.js
      elsif params[:category_id] == '6'
        @events = Event.all.where(status: false)
        format.js
      else
        @events = Event.all.where(category_id: params[:category_id], status: true)
        format.js
      end
    end
  end

  def approve_event
    @event = Event.find(params[:id])
    if @event.update(status: true)
      @events = Event.all
      respond_to do |format|
        format.js { render 'category_events.js.erb'}
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.destroy
        if current_user.admin?
          @events = Event.all.where(status: true)
          format.js { render 'user_admin_events.js.erb'}
        else
          @events = current_user.events
          format.js { render 'user_admin_events.js.erb'}
        end
      end
    end
  end

  private

    def event_params
       params.require(:event).permit(:name, :description, :image, :address, :from, :to, :start, :mobile, :category_id, :status, :user_id)
    end

end
