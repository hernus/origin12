class TeamsController < ApplicationController

  helper_method \
    :teams,
    :team

  before_filter :new_team, only: [ :new, :create ]
  
  def index
    respond_to do |format|
      format.html
      format.json { render json: teams }
    end
  end

# def show
#   respond_to do |format|
#     format.html 
#     format.json { render json: team }
#   end
# end

  def new
    respond_to do |format|
      format.html
      format.json { render json: team }
    end
  end

  def create
    respond_to do |format|
      if team.save
        format.html { redirect_to teams_path, notice: 'Team was successfully created.' }
        format.json { render json: team, status: :created, location: team }
      else
        format.html { render action: "new" }
        format.json { render json: team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if team.update_attributes(params[:team])
        format.html { redirect_to teams_path, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

private

  def teams
    @teams ||= current_company.teams
  end

  def team
    @team ||= teams.find(params[:id])
  end

  def new_team
    @team = current_company.teams.build(params[:team])
  end

end
