class ScheduleRatesController < ApplicationController

  before_filter :build_schedule_rate, only: [ :create ]

  def index
    respond_to do |format|
      format.html
      format.json { render json: schedule_rates }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @schedule_rate }
    end
  end

  def create
    respond_to do |format|
      if schedule_rate.save
        format.html { redirect_to project_schedule_rates_path(project), notice: 'Schedule rate was successfully created.' }
        format.json { render json: schedule_rate, status: :created, location: schedule_rate }
      else
        format.html { render action: "new" }
        format.json { render json: schedule_rate.errors, status: :unprocessable_entity }
      end
    end
  end

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

  # def destroy
  #   @schedule_rate = ScheduleRate.find(params[:id])
  #   @schedule_rate.destroy
  #   respond_to do |format|
  #     format.html { redirect_to schedule_rates_url }
  #     format.json { head :no_content }
  #   end
  # end

private

  ### Exposures

  helper_method \
      :project,
      :schedule_rates,
      :schedule_rate,
      :most_recent_schedule_rate,
      :return_to_path

  def project
    @project ||= begin
      current_company.projects.find(params[:project_id])
    end
  end

  def schedule_rates
    @schedule_rates ||= begin
      project.schedule_rates.employee(current_employee)
    end
  end

  def schedule_rate
    @schedule_rate ||= begin
      project.schedule_rates.employee(current_employee).build
    end
  end

  def most_recent_schedule_rate
    @most_recent_schedule_rate ||= schedule_rates.last
  end

  def build_schedule_rate
    @schedule_rate ||= begin
      project.schedule_rates.employee(current_employee).new(params[:schedule_rate])
    end
  end

  def return_to_path
    @return_to_path ||= session[:return_to_path]
  end

end
