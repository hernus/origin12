class ProjectsController < ApplicationController

  helper_method \
      :customer,
      :customer?,
      :customers,
      :projects,
      :project

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to customers_path
  end

  before_filter :new_project, only: [ :new, :create ]

  def index
    respond_to do |format|
      format.html
      format.json { render json: projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  # def show
  #   @project = Project.find(params[:id])
  #     format.html # show.html.erb
  #     format.json { render json: @project }
  #   end
  # end

  def new
    respond_to do |format|
      format.html
      format.json { render json: project }
    end
  end

  def create
    respond_to do |format|
      if project.save
        format.html { redirect_to customer_projects_path(customer), notice: 'Project was successfully created.' }
        format.json { render json: project, status: :created, location: project }
      else
        format.html { render action: "new" }
        format.json { render json: project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if project.update_attributes(params[:project])
        format.html { redirect_to customer_projects_path(customer), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  # def destroy
  #   @project = Project.find(params[:id])
  #   @project.destroy
  #   respond_to do |format|
  #     format.html { redirect_to projects_url }
  #     format.json { head :no_content }
  #   end
  # end

private

  def customer
    @customer ||= begin
      if params[:customer_id]
        current_company.customers.find(params[:customer_id])
      end
    end
  end

  def customer?
    customer.present?
  end

  def customers
    @customers ||= current_company.customers
  end

  def projects
    @projects ||= begin
      if customer?
        customer.projects.order('`created_at` DESC')
      else
        current_company.projects.includes(:customer).order('`created_at` DESC')
      end
    end
  end

  def project
    @project ||= projects.find(params[:id])
  end

  def new_project
    @project = projects.build(params[:project])
  end

end
