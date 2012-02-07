class AdminFormsController < ApplicationController

  before_filter :authenticate_zdus

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(params[:form])
    if @form.save
      flash[:notice] = 'Obrazec uspešno shranjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    if @form.update_attributes(params[:form])
      flash[:notice] = 'Obrazec uspešno osvežen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if Form.find(params[:id]).destroy
      flash[:notice] = 'Obrazec izbrisan!'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to zdus_forms_path
  end
end
