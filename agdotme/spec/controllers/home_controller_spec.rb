require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET Landing" do
    it "renders the Landing template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET bio" do
    it "renders the Bio template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET thanks" do
    it "renders the Thanks template" do
      get :thanks
      expect(response).to render_template("thanks")
    end
  end
end
