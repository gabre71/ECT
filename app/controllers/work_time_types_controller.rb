class WorkTimeTypesController < ApplicationController
  # GET /work_time_types
  # GET /work_time_types.json
  def index
    @work_time_types = WorkTimeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_time_types }
    end
  end

  # GET /work_time_types/1
  # GET /work_time_types/1.json
  def show
    @work_time_type = WorkTimeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_time_type }
    end
  end

  # GET /work_time_types/new
  # GET /work_time_types/new.json
  def new
    @work_time_type = WorkTimeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_time_type }
    end
  end

  # GET /work_time_types/1/edit
  def edit
    @work_time_type = WorkTimeType.find(params[:id])
  end

  # POST /work_time_types
  # POST /work_time_types.json
  def create
    @work_time_type = WorkTimeType.new(params[:work_time_type])

    respond_to do |format|
      if @work_time_type.save
        format.html { redirect_to @work_time_type, notice: 'Work Time Type was successfully created.' }
        format.json { render json: @work_time_type, status: :created, location: @work_time_type }
      else
        format.html { render action: "new" }
        format.json { render json: @work_time_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_time_types/1
  # PUT /work_time_types/1.json
  def update
    @work_time_type = WorkTimeType.find(params[:id])

    respond_to do |format|
      if @work_time_type.update_attributes(params[:work_time_type])
        format.html { redirect_to @work_time_type, notice: 'Work Time Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_time_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_time_types/1
  # DELETE /work_time_types/1.json
  def destroy
    @work_time_type = WorkTimeType.find(params[:id])
    @work_time_type.destroy

    respond_to do |format|
      format.html { redirect_to work_time_types_url }
      format.json { head :no_content }
    end
  end
end
