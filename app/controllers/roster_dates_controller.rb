class RosterDatesController < ApplicationController

  helper_method \
      :current_date,
      :roster_dates,
      :roster_date,
      :duplicate_date

  before_filter :build_default_roster_date, only: [ :new, :edit ]

  before_filter :build_roster_date, only: [ :create ]

  def index
    respond_to do |format|
      format.html
      format.json { render json: roster_dates }
    end
  end

  def new
    respond_to do |format|
      format.html 
      format.json { render json: roster_date }
    end
  end

  def create
    respond_to do |format|
      if current_company.roster_dates.push(roster_date)
        roster_date.duplicate(*params[:wday])
        format.html { redirect_to_rosters_dates_or_schedule_rates }
        format.json { render json: roster_date, status: :created, location: roster_date }
      else
        format.html { render action: "new" }
        format.json { render json: roster_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if roster_date.update_attributes(params[:roster_date])
        roster_date.duplicate(*params[:wday])
        format.html { redirect_to_rosters_dates_or_schedule_rates }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: roster_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def duplicate
    respond_to do |format|
      if RosterDate.duplicate(params[:duplicate], current_employee)
        format.html { redirect_to roster_dates_path, notice: 'Roster week was successfully duplicated.' }
        format.json { head :no_content }        
      else
        format.html { render action: "edit" }
        format.json { head :status, :unprocessable_entity }
      end
    end
  end

private

  ### Exposures

  def roster_dates
    @roster_dates ||= current_employee.roster_dates.company(current_company)
  end

  def roster_date
    @roster_date ||= begin
      if params[:id]
        # current_company.employees.find(current_employee[:id]).roster_dates.find(params[:id])
        current_employee.roster_dates.company(current_company).find(params[:id])
      else
        new_roster_date
      end
    end
  end

  def new_roster_date
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @roster_date = current_employee.roster_dates.build(date: date)
  end

  def build_roster_date
    @roster_date = roster_dates.build(params[:roster_date])
  end

  def build_default_roster_date
    roster_date.build_default_rosters
  end

  def duplicate_date
    @duplicate_date ||= Date.parse(params[:duplicate_date])
  end

  ###

  def redirect_to_rosters_dates_or_schedule_rates
    project_id = params[:schedule_rates_project_id]
    if project_id.present?
      session[:return_to_path] = edit_roster_date_path(roster_date)
      redirect_to project_schedule_rates_path(project_id)
    else
      redirect_to roster_dates_path, notice: "Roster week was successfully #{params[:action]}d."
    end
  end

  # def show
  #   @roster_date = RosterDate.find(params[:id])
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @roster_date }
  #   end
  # end

  # def destroy
  #   @roster_date = RosterDate.find(params[:id])
  #   @roster_date.destroy
  #   respond_to do |format|
  #     format.html { redirect_to roster_dates_url }
  #     format.json { head :no_content }
  #   end
  # end

end
