class SchedulerController < ApplicationController
  def show
    @meetings = Meeting.all
    respond_to do |format|
      format.html
    end
  end
end
