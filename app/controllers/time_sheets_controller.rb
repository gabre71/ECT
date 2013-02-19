class TimeSheetsController < ApplicationController
  load_and_authorize_resource :except => [:date_view]
  # GET /time_sheets
  # GET /time_sheets.json
  def index
    @time_sheets = (TimeSheet.where("planned_holiday_id is not null") + TimeSheet.joins(:time_frame).order("time_frames.from_time")).uniq
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_sheets }
    end
  end

  # GET /time_sheets/1
  # GET /time_sheets/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_sheet }
    end
  end
  
  def date_view
    @time_sheets = TimeSheet.joins(:time_frame).order("time_frames.from_time").find_all_by_work_date(params[:id])
    @date = params[:id] ? Date.parse(params[:id]) : Date.today
    @type = "day" 
  end

  # GET /time_sheets/new
  # GET /time_sheets/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_sheet }
    end
  end

  # GET /time_sheets/1/edit
  def edit
    @type = params[:type]
  end

  # POST /time_sheets
  # POST /time_sheets.json
  def create
    respond_to do |format|
      if @time_sheet.save
        format.html { redirect_to @time_sheet, notice: 'Time Sheet was successfully created.' }
        format.json { render json: @time_sheet, status: :created, location: @time_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_sheets/1
  # PUT /time_sheets/1.json
  def update
    respond_to do |format|
      if @time_sheet.update_attributes(params[:time_sheet])
        format.html { redirect_to time_sheets_path, notice: 'Time Sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" , notice: @time_sheet.errors}
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_sheets/1
  # DELETE /time_sheets/1.json
  def destroy
    @time_sheet.destroy

    respond_to do |format|
      format.html { redirect_to time_sheets_url }
      format.json { head :no_content }
    end
  end
end
