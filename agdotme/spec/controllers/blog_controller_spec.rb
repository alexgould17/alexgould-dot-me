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
      expect(assigns(:blogs)).to eq([:test_blog])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @blog" do
      get :new
      expect(assigns(:blog)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the size of Blog by 1" do
      expect{Blog.create!(title: "t", author: "a", hook: "h", body: "b")}.to change(Blog, :count).by(1)
    end

    it "assigns the new blog to @blog" do
      post :create, params: { blog: {title: "t", author: "a", hook: "h", body: "b"}}
      expect(assigns(:blog)).to eq Blog.last
    end

    it "redirects to the new blog" do
      post :create, params: { blog: {title: "t", author: "a", hook: "h", body: "b"}}
      expect(response).to redirect_to Blog.last
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit
      expect(response).to render_template :edit
    end

    it "assigns blog to be updated to @blog" do
      get :edit, params: { id: test_blog.id }
      blog_instance = assigns(:blog)

      expect(blog_instance.id).to eq test_blog.id
      expect(blog_instance.title).to eq test_blog.title
      expect(blog_instance.author).to eq test_blog.author
      expect(blog_instance.hook).to eq test_blog.hook
      expect(blog_instance.body).to eq test_blog.body
    end
  end

  describe "PUT #update" do
    it "updates the blog with expected attributes" do
      new_title = "u"
      new_author = "b"
      new_hook = "i"
      new_body = "c"

      put :update, params: { id: test_blog.id, blog: { title: new_title, author: new_author, hook: new_hook, body: new_body }}
      updated_blog = assigns(blog)

      expect(blog_instance.id).to eq test_blog.id
      expect(blog_instance.title).to eq new_title
      expect(blog_instance.author).to eq new_author
      expect(blog_instance.hook).to eq new_hook
      expect(blog_instance.body).to eq new_body
    end

    it "redirects to the updated post" do
      put :update, params: { id: test_blog.id, blog: {title: "u", author: "b", hook: "i", body: "c" }}
      expect(response).to redirect_to test_blog
    end
  end

  describe "DELETE #destroy" do
    it "deletes the blog" do
      delete :destroy, params: { id: test_blog.id }

      count = Blog.where({id: test_blog.id}).size
      expect(count).to eq 0
    end

    it "redirects to Blog index" do
      delete :destroy, params: { id: test_blog.id }
      expect(response).to redirect_to blogs_path
    end
  end
end
