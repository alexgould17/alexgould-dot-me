class BlogsController < ApplicationController
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
      redirect_to @blog, flash: { notice: "Blog \"#{@blog.title}\" created & published." }
    else
      render :new, flash: { alert: "Error creating blog! Please try again." }
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
      redirect_to @blog, flash: { notice: "Blog \"#{@blog.title}\" updated & published." }
    else
      render :edit, flash: { alert: "Error updating blog! Please try again." }
    end
  end

  def destroy
    @blog = Blog.find(params[:id])

    if @blog.destroy
      redirect_to blogs_path, flash: { notice: "Blog \"#{@blog.title}\" deleted." }
    else
      render :show, flash: { alert: "Error deleting blog! Please try again." }
    end
  end
end
