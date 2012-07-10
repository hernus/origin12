class ScheduleRatesController < ApplicationController

  def index
    
    @schedule_rates = ScheduleRate.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_rates }
    end
  end

  # GET /schedule_rates/1
  # GET /schedule_rates/1.json
  def show
    @schedule_rate = ScheduleRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_rate }
    end
  end

  # GET /schedule_rates/new
  # GET /schedule_rates/new.json
  def new
    @schedule_rate = ScheduleRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_rate }
    end
  end

  # GET /schedule_rates/1/edit
  def edit
    @schedule_rate = ScheduleRate.find(params[:id])
  end

  # POST /schedule_rates
  # POST /schedule_rates.json
  def create
    @schedule_rate = ScheduleRate.new(params[:schedule_rate])

    respond_to do |format|
      if @schedule_rate.save
        format.html { redirect_to @schedule_rate, notice: 'Schedule rate was successfully created.' }
        format.json { render json: @schedule_rate, status: :created, location: @schedule_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_rates/1
  # PUT /schedule_rates/1.json
  def update
    @schedule_rate = ScheduleRate.find(params[:id])

    respond_to do |format|
      if @schedule_rate.update_attributes(params[:schedule_rate])
        format.html { redirect_to @schedule_rate, notice: 'Schedule rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_rates/1
  # DELETE /schedule_rates/1.json
  def destroy
    @schedule_rate = ScheduleRate.find(params[:id])
    @schedule_rate.destroy

    respond_to do |format|
      format.html { redirect_to schedule_rates_url }
      format.json { head :no_content }
    end
  end

private

  ### Exposures

  def project
    @project ||= current_company.projects.find(params[:id])
  end

  def schedule_rates
    @schedule_rates ||= project.schedule_rates.employee(current_employee)
  end
end
