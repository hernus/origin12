class CustomersController < ApplicationController

  helper_method \
      :customers,
      :customer

  before_filter :new_customer, only: [ :new, :create ]

  def index
    respond_to do |format|
      format.html
      format.json { render json: customers }
    end
  end

  # def show
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: customer }
  #   end
  # end

  def new
    respond_to do |format|
      format.html
      format.json { render json: customer }
    end
  end

  def create
    respond_to do |format|
      if customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
        format.json { render json: customer, status: :created, location: customer }
      else
        format.html { render action: "new" }
        format.json { render json: customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if customer.update_attributes(params[:customer])
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   customer.destroy
  #   respond_to do |format|
  #     format.html { redirect_to customers_url }
  #     format.json { head :no_content }
  #   end
  # end

private

  ### Exposures

  def customers
    @customers ||= current_company.customers
  end

  def customer
    @customer ||= customers.find(params[:id])
  end

  def new_customer
    @customer ||= customers.build(params[:customer])
  end
end