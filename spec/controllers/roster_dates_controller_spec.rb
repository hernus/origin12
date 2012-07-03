require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RosterDatesController do

  # This should return the minimal set of attributes required to create a valid
  # RosterDate. As you add validations to RosterDate, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RosterDatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all roster_dates as @roster_dates" do
      roster_date = RosterDate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:roster_dates).should eq([roster_date])
    end
  end

  describe "GET show" do
    it "assigns the requested roster_date as @roster_date" do
      roster_date = RosterDate.create! valid_attributes
      get :show, {:id => roster_date.to_param}, valid_session
      assigns(:roster_date).should eq(roster_date)
    end
  end

  describe "GET new" do
    it "assigns a new roster_date as @roster_date" do
      get :new, {}, valid_session
      assigns(:roster_date).should be_a_new(RosterDate)
    end
  end

  describe "GET edit" do
    it "assigns the requested roster_date as @roster_date" do
      roster_date = RosterDate.create! valid_attributes
      get :edit, {:id => roster_date.to_param}, valid_session
      assigns(:roster_date).should eq(roster_date)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RosterDate" do
        expect {
          post :create, {:roster_date => valid_attributes}, valid_session
        }.to change(RosterDate, :count).by(1)
      end

      it "assigns a newly created roster_date as @roster_date" do
        post :create, {:roster_date => valid_attributes}, valid_session
        assigns(:roster_date).should be_a(RosterDate)
        assigns(:roster_date).should be_persisted
      end

      it "redirects to the created roster_date" do
        post :create, {:roster_date => valid_attributes}, valid_session
        response.should redirect_to(RosterDate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved roster_date as @roster_date" do
        # Trigger the behavior that occurs when invalid params are submitted
        RosterDate.any_instance.stub(:save).and_return(false)
        post :create, {:roster_date => {}}, valid_session
        assigns(:roster_date).should be_a_new(RosterDate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RosterDate.any_instance.stub(:save).and_return(false)
        post :create, {:roster_date => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested roster_date" do
        roster_date = RosterDate.create! valid_attributes
        # Assuming there are no other roster_dates in the database, this
        # specifies that the RosterDate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RosterDate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => roster_date.to_param, :roster_date => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested roster_date as @roster_date" do
        roster_date = RosterDate.create! valid_attributes
        put :update, {:id => roster_date.to_param, :roster_date => valid_attributes}, valid_session
        assigns(:roster_date).should eq(roster_date)
      end

      it "redirects to the roster_date" do
        roster_date = RosterDate.create! valid_attributes
        put :update, {:id => roster_date.to_param, :roster_date => valid_attributes}, valid_session
        response.should redirect_to(roster_date)
      end
    end

    describe "with invalid params" do
      it "assigns the roster_date as @roster_date" do
        roster_date = RosterDate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RosterDate.any_instance.stub(:save).and_return(false)
        put :update, {:id => roster_date.to_param, :roster_date => {}}, valid_session
        assigns(:roster_date).should eq(roster_date)
      end

      it "re-renders the 'edit' template" do
        roster_date = RosterDate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RosterDate.any_instance.stub(:save).and_return(false)
        put :update, {:id => roster_date.to_param, :roster_date => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested roster_date" do
      roster_date = RosterDate.create! valid_attributes
      expect {
        delete :destroy, {:id => roster_date.to_param}, valid_session
      }.to change(RosterDate, :count).by(-1)
    end

    it "redirects to the roster_dates list" do
      roster_date = RosterDate.create! valid_attributes
      delete :destroy, {:id => roster_date.to_param}, valid_session
      response.should redirect_to(roster_dates_url)
    end
  end

end