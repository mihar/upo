class AdminProjectsController < ApplicationController

  before_filter :authenticate_union, :set_segment
  before_filter :find_project, :except => [:new, :create]
  layout :determine_layout
  
  def new
    @project = Project.new
    @project.union_id = @union.id
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Projekt je bil uspešno ustvarjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Projekt je bil uspešno shranjen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @project and @project.destroy
      flash[:notice] = 'Projekt uspešno izbrisan.'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to normal_link('projects')
  end
  
  def find_project
    @project = Project.find_for_union( params[:id], @union.id )
  end

end