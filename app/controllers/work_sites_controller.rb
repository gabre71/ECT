class WorkSitesController < ApplicationController
  load_and_authorize_resource
    # GET /work_sites
  # GET /work_sites.json
  def index
    @work_sites = WorkSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_sites }
    end
  end

  # GET /work_sites/1
  # GET /work_sites/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_site }
    end
  end

  # GET /work_sites/new
  # GET /work_sites/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_site }
    end
  end

  # GET /work_sites/1/edit
  def edit
  end

  # POST /work_sites
  # POST /work_sites.json
  def create
    respond_to do |format|
      if @work_site.save
        format.html { redirect_to work_sites_path, notice: 'WorkSite was successfully created.' }
        format.json { render json: work_sites_path, status: :created, location: @work_site }
      else
        format.html { render action: "new" }
        format.json { render json: @work_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_sites/1
  # PUT /work_sites/1.json
  def update
    respond_to do |format|
      if @work_site.update_attributes(params[:work_site])
        format.html { redirect_to work_sites_path, notice: 'WorkSite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_sites/1
  # DELETE /work_sites/1.json
  def destroy
    @work_site.destroy

    respond_to do |format|
      format.html { redirect_to work_sites_url }
      format.json { head :no_content }
    end
  end
end
