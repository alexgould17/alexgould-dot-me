class BlogController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
