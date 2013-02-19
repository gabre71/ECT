class TimeFramesController < ApplicationController
  before_filter :check_destroyable , :only => :destroy

  load_and_authorize_resource
  # GET /time_frames
  # GET /time_frames.json
  def index
    @time_frames = TimeFrame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_frames }
    end
  end

  # GET /time_frames/1
  # GET /time_frames/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_frame }
    end
  end

  # GET /time_frames/new
  # GET /time_frames/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_frame }
    end
  end

  # GET /time_frames/1/edit
  def edit
  end

  # POST /time_frames
  # POST /time_frames.json
  def create

    respond_to do |format|
      if @time_frame.save
        format.html { redirect_to time_frames_path, notice: 'Time frame was successfully created.' }
        format.json { render json: @time_frame, status: :created, location: @time_frame }
      else
        format.html { render action: "new" }
        format.json { render json: @time_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_frames/1
  # PUT /time_frames/1.json
  def update

    respond_to do |format|
      if @time_frame.update_attributes(params[:time_frame])
        format.html { redirect_to time_frames_path, notice: 'Time frame was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_frames/1
  # DELETE /time_frames/1.json
  def destroy
    @time_frame.destroy

    respond_to do |format|
      format.html { redirect_to time_frames_url }
      format.json { head :no_content }
    end
  end

  protected
  
  def check_destroyable
    @time_frame = TimeFrame.find(params[:id])
    unless @time_frame.planned_work_times.empty?
      redirect_to time_frames_path, :alert => "Timeframe is in use! Not deletable! "
      return
    end
  end
end