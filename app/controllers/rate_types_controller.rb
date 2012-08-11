class RateTypesController < ApplicationController
  # GET /rate_types
  # GET /rate_types.json
  def index
    @rate_types = RateType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rate_types }
    end
  end

  # GET /rate_types/1
  # GET /rate_types/1.json
  def show
    @rate_type = RateType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rate_type }
    end
  end

  # GET /rate_types/new
  # GET /rate_types/new.json
  def new
    @rate_type = RateType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rate_type }
    end
  end

  # GET /rate_types/1/edit
  def edit
    @rate_type = RateType.find(params[:id])
  end

  # POST /rate_types
  # POST /rate_types.json
  def create
    @rate_type = RateType.new(params[:rate_type])

    respond_to do |format|
      if @rate_type.save
        format.html { redirect_to @rate_type, notice: 'Rate type was successfully created.' }
        format.json { render json: @rate_type, status: :created, location: @rate_type }
      else
        format.html { render action: "new" }
        format.json { render json: @rate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rate_types/1
  # PUT /rate_types/1.json
  def update
    @rate_type = RateType.find(params[:id])

    respond_to do |format|
      if @rate_type.update_attributes(params[:rate_type])
        format.html { redirect_to @rate_type, notice: 'Rate type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rate_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_types/1
  # DELETE /rate_types/1.json
  def destroy
    @rate_type = RateType.find(params[:id])
    @rate_type.destroy

    respond_to do |format|
      format.html { redirect_to rate_types_url }
      format.json { head :no_content }
    end
  end
end
