class SchedulersController < ApplicationController

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

  def toggle_scheduler
    @meeting = Meeting.find(params[:id])

    if @meeting != nil?
      if params[:field] == 'package_ready'
        @meeting.update(package_ready: params[:bool])
      elsif params[:field] == 'package_delivered'
        @meeting.update(package_delivered: params[:bool])
      else
        flash[:alert] = "Erro, tente novamente"
      end
      flash[:sucess] = "Salvo com sucesso!"
    else
      flash[:alert] = "Erro, tente novamente"
    end
    head :ok
  end  

end
