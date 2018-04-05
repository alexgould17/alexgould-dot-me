class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new

    @blog.title = params[:blog][:title]
    @blog.author = params[:blog][:author]
    @blog.hook = params[:blog][:hook]
    @blog.body = params[:blog][:body]

    if @blog.save
      redirect_to @blog, params: { notice: "Blog post saved & published" }
    else
      flash.now[:alert] = "Blog post not saved. Please try again!"
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    @blog.title = params[:blog][:title]
    @blog.author = params[:blog][:author]
    @blog.hook = params[:blog][:hook]
    @blog.body = params[:blog][:body]

    if @blog.save
      redirect_to @blog, params: { notice: "Blog post updates saved." }
    else
      flash.now[:alert] = "Blog post not saved. Please try again!"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])

    if @blog.destroy
      redirect_to blogs_path, params: { notice: "Blog post deleted!" }
    else
      flash.now[:alert] = "Blog post not deleted. Please try again!"
      render :show
    end
  end
end
