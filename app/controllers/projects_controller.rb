class ProjectsController < ApplicationController

  helper_method :projects

  def index
    respond_to do |format|
      format.html
      format.js # TODO Get rid of JS response and use JSON
      format.json { render json: projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  # def show
  #   @project = Project.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @project }
  #   end
  # end

  # GET /projects/new
  # GET /projects/new.json
  # def new
  #   @project = Project.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @project }
  #   end
  # end

  # GET /projects/1/edit
  # def edit
  #   @project = Project.find(params[:id])
  # end

  # POST /projects
  # POST /projects.json
  # def create
  #   @project = Project.new(params[:project])
  # 
  #   respond_to do |format|
  #     if @project.save
  #       format.html { redirect_to @project, notice: 'Project was successfully created.' }
  #       format.json { render json: @project, status: :created, location: @project }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @project.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /projects/1
  # PUT /projects/1.json
  # def update
  #   @project = Project.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @project.update_attributes(params[:project])
  #       format.html { redirect_to @project, notice: 'Project was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @project.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /projects/1
  # DELETE /projects/1.json
  # def destroy
  #   @project = Project.find(params[:id])
  #   @project.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to projects_url }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def projects
    @projects ||= current_company.customers.find(params[:customer_id]).projects
  end

end
