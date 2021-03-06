class ProjectsController < ApplicationController
before_action :project_find, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all.order("created_at DESC")
  end


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: " New Project saved "
    else
      render 'new', notice: "Oh no, Project was not saved!"
    end
  end

  def show

  end

  def edit

  end

  def update
      if @project.update(project_params)
        redirect_to @project, notice: "successfully updated!"
      else
        render 'edit',notice: "Oh no! unable to update"
      end
  end

  def destroy
    @project.destroy
    redirect_to projects_path 
  end

private

def project_params
  params.require(:project).permit(:title, :description, :link, :slug)
end

def project_find
  @project = Project.friendly.find(params[:id])
end

end
