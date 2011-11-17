require 'spec_helper'
describe TalksController do
  def valid_attributes
    {name: "John Doe", email: "john_doe@gmail.com", title: "The best talk ever", description: "You'll see"}
  end

  describe "GET index" do
    it "assigns all talks as @talks" do
      talk = Talk.create! valid_attributes
      get :index
      assigns(:talks).should eq([talk])
    end
  end

  describe "GET new" do
    it "assigns a new talk as @talk" do
      get :new
      assigns(:talk).should be_a_new(Talk)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Talk" do
        expect {
          post :create, :talk => valid_attributes
        }.to change(Talk, :count).by(1)
      end

      it "assigns a newly created talk as @talk" do
        post :create, :talk => valid_attributes
        assigns(:talk).should be_a(Talk)
        assigns(:talk).should be_persisted
      end

      it "redirects to the created talk" do
        post :create, :talk => valid_attributes
        response.should redirect_to(controller: :talks, action: :index)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved talk as @talk" do
        # Trigger the behavior that occurs when invalid params are submitted
        Talk.any_instance.stub(:save).and_return(false)
        post :create, :talk => {}
        assigns(:talk).should be_a_new(Talk)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Talk.any_instance.stub(:save).and_return(false)
        post :create, :talk => {}
        response.should render_template("new")
      end
    end
  end
end
