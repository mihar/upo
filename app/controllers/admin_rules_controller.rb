class AdminRulesController < ApplicationController

  before_filter :authenticate_section, :set_segment
  before_filter :find_rules
  layout :determine_layout

  
  def edit    
    if @rules.nil?
      @rules = Rules.create({:subunion_id => params[:subunion_id], :union_id => @union.id,  :rules => 'Pravila'})
    end
  end

  def update
    if @rules.update_attributes(params[:rules])
      flash[:notice] = 'Pravila osvežena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end
  
  protected
  
  def redirect_to_section
    redirect_to normal_link 'rules'
  end
  
  def find_rules
    @rules = Rules.find_for_zdus( params[:id] ) if in_zdus?
    @rules = Rules.find_for_union( params[:id], @union.id ) if in_union?
    @rules = Rules.find_for_subunion( params[:id], params[:subunion_id] ) if in_subunion?    
  end
end
