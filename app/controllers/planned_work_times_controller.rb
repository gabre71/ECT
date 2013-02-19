class PlannedWorkTimesController < ApplicationController
  load_and_authorize_resource
    # GET /planned_work_times
  # GET /planned_work_times.json
  def index
    @planned_work_times = PlannedWorkTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planned_work_times }
    end
  end

  # GET /planned_work_times/1
  # GET /planned_work_times/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planned_work_time }
    end
  end

  # GET /planned_work_times/new
  # GET /planned_work_times/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planned_work_time }
    end
  end

  # GET /planned_work_times/1/edit
  def edit

  end

  # POST /planned_work_times
  # POST /planned_work_times.json
  def create

    respond_to do |format|
      if @planned_work_time.save
        format.html { redirect_to @planned_work_time, notice: 'Planned Work Time was successfully created.' }
        format.json { render json: @planned_work_time, status: :created, location: @planned_work_time }
      else
        format.html { render action: "new" }
        format.json { render json: @planned_work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planned_work_times/1
  # PUT /planned_work_times/1.json
  def update

    respond_to do |format|
      if @planned_work_time.update_attributes(params[:planned_work_time])
        format.html { redirect_to @planned_work_time, notice: 'Planned Work Time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @planned_work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_work_times/1
  # DELETE /planned_work_times/1.json
  def destroy
    @planned_work_time = PlannedWorkTime.find(params[:id])
    @planned_work_time.destroy

    respond_to do |format|
      format.html { redirect_to planned_work_times_url }
      format.json { head :no_content }
    end
  end
end
