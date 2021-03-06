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

describe SpotsController do
  before (:each) do
    @spot = FactoryGirl.create(:spot)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  # This should return the minimal set of attributes required to create a valid
  # Spot. As you add validations to Spot, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { title: "MyText", lat: 2, long: 5 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpotsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all spots as @spots" do
      get :index, {}, valid_session
      assigns(:spots).should eq([@spot])
    end
  end

  describe "GET show" do
    it "assigns the requested spot as @spot" do
      get :show, {:id => @spot.to_param}, valid_session
      assigns(:spot).should eq(@spot)
    end
  end

  describe "GET new" do
    it "assigns a new spot as @spot" do
      get :new, {}, valid_session
      assigns(:spot).should be_a_new(Spot)
    end
  end

  describe "GET edit" do
    it "assigns the requested spot as @spot" do
      get :edit, {:id => @spot.to_param}, valid_session
      assigns(:spot).should eq(@spot)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spot" do
        expect {
          post :create, {:spot => valid_attributes}, valid_session
        }.to change(Spot, :count).by(1)
      end

      it "assigns a newly created spot as @spot" do
        post :create, {:spot => valid_attributes}, valid_session
        assigns(:spot).should be_a(Spot)
        assigns(:spot).should be_persisted
      end

      it "redirects to the created spot" do
        post :create, {:spot => valid_attributes}, valid_session
        response.should redirect_to(Spot.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spot as @spot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spot.any_instance.stub(:save).and_return(false)
        post :create, {:spot => { "title" => "invalid value" }}, valid_session
        assigns(:spot).should be_a_new(Spot)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spot.any_instance.stub(:save).and_return(false)
        post :create, {:spot => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spot" do
        # Assuming there are no other spots in the database, this
        # specifies that the Spot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Spot.any_instance.should_receive(:update_attributes).with({ "title" => "MyText" })
        put :update, {id: @spot.to_param, spot: { "title" => "MyText" }}, valid_session
      end

      it "assigns the requested spot as @spot" do
        put :update, {:id => @spot.to_param, :spot => valid_attributes}, valid_session
        assigns(:spot).should eq(@spot)
      end

      it "redirects to the spot" do
        put :update, {:id => @spot.to_param, :spot => valid_attributes}, valid_session
        response.should redirect_to(@spot)
      end
    end

    describe "with invalid params" do
      it "assigns the spot as @spot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spot.any_instance.stub(:save).and_return(false)
        put :update, {:id => @spot.to_param, :spot => { "title" => "invalid value" }}, valid_session
        assigns(:spot).should eq(@spot)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spot.any_instance.stub(:save).and_return(false)
        put :update, {id: @spot.to_param, spot: { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spot" do
      expect {
        delete :destroy, {id: @spot.to_param}, valid_session
      }.to change(Spot, :count).by(-1)
    end

    it "redirects to the spots list" do
      delete :destroy, {id: @spot.to_param}, valid_session
      response.should redirect_to(spots_url)
    end
  end

end
