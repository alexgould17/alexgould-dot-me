require 'rails_helper'

RSpec.describe BlogController, type: :controller do

  let(:test_blog) { Blog.create!(title: "Test Blog", author: "Alex", hook: "Dendi", body: "Pudge at TI8!") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns :test_blog to @blogs" do
      get :index
      expect(assigns(:blog)).to eq([:test_blog])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
