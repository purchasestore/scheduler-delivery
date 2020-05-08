class SchedulerController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show_delivers, :clients_delivers]

  def show
    @meetings = Meeting.all
    respond_to do |format|
      format.html
    end
  end

  def admin
    respond_to do |format|
      format.html
    end
  end

  def show_delivers
    @meetings = Meeting.all
    respond_to do |format|
      format.html
    end
  end  

  def clients_delivers
    @meetings = Meeting.all
    respond_to do |format|
      format.html
    end
  end

end
