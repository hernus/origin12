class RostersController < ApplicationController

  helper_method \
      :current_date,
      :rosters,
      :roster

  def index
    respond_to do |format|
      format.html
      format.json { render json: rosters }
    end
  end

  # def show
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: roster }
  #   end
  # end

  # def new
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: roster }
  #   end
  # end

  # def create
  #   @roster = Roster.new(params[:roster])
  #   respond_to do |format|
  #     if @roster.save
  #       format.html { redirect_to @roster, notice: 'Roster was successfully created.' }
  #       format.json { render json: @roster, status: :created, location: @roster }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @roster.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   @roster = Roster.find(params[:id])
  #   respond_to do |format|
  #     if @roster.update_attributes(params[:roster])
  #       format.html { redirect_to @roster, notice: 'Roster was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @roster.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @roster = Roster.find(params[:id])
  #   @roster.destroy
  #   respond_to do |format|
  #     format.html { redirect_to rosters_url }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def current_date
    @current_date ||= params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def rosters
    @rosters ||= Roster.all
  end

  def roster
    params[:id] ? Roster.find(params[:id]) : Roster.new
  end

end
