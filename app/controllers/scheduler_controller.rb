class SchedulerController < ApplicationController

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

end
