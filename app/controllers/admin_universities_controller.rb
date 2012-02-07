class AdminUniversitiesController < ApplicationController

  before_filter :authenticate_zdus
  before_filter :find_university, :except => [:new, :create]
  
  def new
    @university = University.new
  end

  def create
    @university = University.new(params[:university])
    if @university.save
      flash[:notice] = 'Povezava je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @university.update_attributes(params[:university])
      flash[:notice] = 'Povezava je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @university and @university.destroy
      flash[:notice] = 'Povezava uspešno izbrisana.'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to zdus_universities_path
  end
  
  def find_university
    @university = University.find( params[:id] )
  end

end