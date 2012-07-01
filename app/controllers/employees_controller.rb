class EmployeesController < ApplicationController

  helper_method \
    :employees,
    :employee

  def index
    respond_to do |format|
      format.html 
      format.json { render json: employees }
    end
  end

# def show
#   respond_to do |format|
#     format.html # show.html.erb
#     format.json { render json: employee }
#   end
# end
 
  def new
    employee.schedule_rates.build
    respond_to do |format|
      format.html 
      format.json { render json: employee }
    end
  end

  def create
    respond_to do |format|
      if employee.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
        format.json { render json: employee, status: :created, location: employee }
      else
        format.html { render action: "new" }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    employee.employee_rates.build
  end

  def update
    respond_to do |format|
      if employee.update_attributes(params[:employee])
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

private

  def employees
    @employees ||= Employee.all
  end

  def employee
    @employee ||= params[:id] ? Employee.find(params[:id]) : Employee.new(params[:employee])
  end

end
