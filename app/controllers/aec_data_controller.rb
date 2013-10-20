class AecDataController < ApplicationController
  # GET /aec_data
  # GET /aec_data.json
  def index
    @aec_data = AecDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aec_data }
    end
  end

  # GET /aec_data/1
  # GET /aec_data/1.json
  def show
    @aec_datum = AecDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aec_datum }
    end
  end

  # GET /aec_data/new
  # GET /aec_data/new.json
  def new
    @aec_datum = AecDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aec_datum }
    end
  end

  # GET /aec_data/1/edit
  def edit
    @aec_datum = AecDatum.find(params[:id])
  end

  # POST /aec_data
  # POST /aec_data.json
  def create
    @aec_datum = AecDatum.new(params[:aec_datum])

    respond_to do |format|
      if @aec_datum.save
        format.html { redirect_to @aec_datum, notice: 'Aec datum was successfully created.' }
        format.json { render json: @aec_datum, status: :created, location: @aec_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @aec_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aec_data/1
  # PUT /aec_data/1.json
  def update
    @aec_datum = AecDatum.find(params[:id])

    respond_to do |format|
      if @aec_datum.update_attributes(params[:aec_datum])
        format.html { redirect_to @aec_datum, notice: 'Aec datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aec_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aec_data/1
  # DELETE /aec_data/1.json
  def destroy
    @aec_datum = AecDatum.find(params[:id])
    @aec_datum.destroy

    respond_to do |format|
      format.html { redirect_to aec_data_url }
      format.json { head :no_content }
    end
  end
end
