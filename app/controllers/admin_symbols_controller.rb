class AdminSymbolsController < ApplicationController

  before_filter :authenticate_section, :set_segment
  before_filter :find_symbolic, :except => [:new, :create]
  layout :determine_layout

	
  def new
    @symbolic = Symbolic.new
    @symbolic.union_id = @union.id
  end

  def create
    @symbolic = Symbolic.new(params[:symbolic])
    if @symbolic.save
      flash[:notice] = 'Simbol je uspešno shranjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @symbolic.update_attributes(params[:symbolic])
      flash[:notice] = 'Simbol je osvežen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @symbolic and @symbolic.destroy
      flash[:notice] = 'Simbol izbrisan.'
    else
      flash[:notice] = 'Napaka pri brisanju simbola!'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to normal_link 'symbols'
  end
  
  def find_symbolic
    @symbolic = Symbolic.find_for_union( params[:id], @union.id )
  end
end
