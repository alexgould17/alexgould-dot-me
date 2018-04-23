class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new

    @project.title = params[:project][:title]
    @project.synopsis = params[:project][:synopsis]
    @project.description = params[:project][:description]
    @project.site_link = params[:project][:site_link]
    @project.source_link = params[:project][:source_link]
    @project.screenshot_link = params[:project][:screenshot_link]

    if @project.save
      redirect_to @project, flash: { notice: "Project \"#{@project.title}\" created & published." }
    else
      render :new, flash: { alert: "Error creating project! Please try again." }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    @project.title = params[:project][:title]
    @project.synopsis = params[:project][:synopsis]
    @project.description = params[:project][:description]
    @project.site_link = params[:project][:site_link]
    @project.source_link = params[:project][:source_link]
    @project.screenshot_link = params[:project][:screenshot_link]

    if @project.save
      redirect_to @project, flash: { notice: "Project \"#{@project.title}\" updated & published." }
    else
      render :edit, flash: { alert: "Error updating project! Please try again." }
    end
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      redirect_to projects_path, flash: { notice: "Project \"#{@project.title}\" deleted." }
    else
      render :show, flash: { alert: "Error deleting project! Please try again." }
    end
  end
end
