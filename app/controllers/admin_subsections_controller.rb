class AdminSubsectionsController < ApplicationController
 
  before_filter :authenticate_section, :set_segment
  before_filter :find_subsection, :except => [:new, :create]
  layout :determine_layout


  def new
    @subsection = Subsection.new
    @subsection.subunion_id = params[:subunion_id]
    @subsection.union_id = @union.id
  end

  def create
    @subsection = Subsection.new(params[:subsection])
    if @subsection.save
      flash[:notice] = 'Sekcija uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @subsection.update_attributes(params[:subsection])
      flash[:notice] = 'Sekcija uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @subsection and @subsection.destroy
      flash[:notice] = 'Sekcija izbrisana.'
    end
    redirect_to_section
  end
  
  
  protected
  
  def redirect_to_section
    redirect_to normal_link('subsections', {:id => nil})
  end
  
  def find_subsection
    @subsection = Subsection.find_for_union( params[:id], @union.id )
  end
end
