class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @availability = Availability.where("start_time <= ?", @meeting[:start_time])
                                .where("end_time >= ?", @meeting[:start_time])

    respond_to do |format|
      if @availability.present?
        @meeting.save
        format.html { redirect_to show_path, notice: 'Agendamento feito com sucesso.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @availability = Availability.where("start_time <= ?", @meeting[:start_time])
                                .where("end_time >= ?", @meeting[:start_time])
    respond_to do |format|
      if @availability.present?
        @meeting.update(meeting_params)
        format.html { redirect_to calendar_path, notice: 'Agendamento Atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Agendamento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def toggle
    @meeting = Meeting.find(params[:id])

    if @meeting != nil?
      @meeting.update(message_sent: params[:bool])
      flash[:sucess] = "Salvo com sucesso!"
    else
      flash[:alert] = "Erro, tente novamente"
    end
    head :ok
  end  


  def duplicate
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting != nil?
        meeting_clone = @meeting.dup
        meeting_clone.save
        format.html { redirect_to meetings_path, notice: 'Cópia Agendamento feita com sucesso.' }
      else
        flash[:alert] = "Erro, tente novamente"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :localization, :phone, :start_time, :products, :total_price, 
                                      :payment_type, :information, :district, :message_sent, :package_ready)
    end
end
