class AdminDepartmentsController < ApplicationController
  
  before_filter :authenticate_section, :set_segment
  before_filter :find_departments, :only => [:edit, :update]
  layout :determine_layout
  
  def new
    @department = Department.new
    @department.union_id = @union.id 
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:notice] = 'Organ uspešno ustvarjen.'
      redirect_to_public
    else
      render :action => 'new'
    end
  end

  def update
    if @department.update_attributes(params[:department])
      flash[:notice] = 'Organ uspešno osvežen.'
      redirect_to_public
    else
      render :action => 'edit'
    end
  end

  def destroy
    if Department.find(params[:id]).destroy
      flash[:notice] = 'Organ uspešno izbrisan.'
    else
      flash[:notice] = 'Napaka pri brisanju organa!'
    end
    
    redirect_to_public
  end
  
  def people_new
    @person = Person.new params[:person]
    @department = Department.find(params[:department_id])
    @person.department = @department
  end
  
  def people_create
    @person = Person.new params[:person]
    if @person.save
      flash[:notice] = 'Oseba uspešno shranjena.'
      redirect_to_public
    else
      @department = Department.find @person.department_id
    end
  end
  
  def people_edit
    @person = Person.find params[:id]
    @department = @person.department
  end
  
  def people_update
    @person = Person.find params[:id]
    if @person.update_attributes params[:person]
      flash[:notice] = 'Oseba uspešno osvežena.'
    else
      flash[:notice] = "Napaka pri shranjevanju..."
    end
    redirect_to_public
  end
  
  def people_destroy
    if Person.find(params[:id]).destroy
      flash[:notice] = 'Oseba uspešno izbrisana!'
    else
      flash[:notice] = 'Napaka pri brisanju osebe!'
    end
    
    redirect_to_public   
  end
    
  protected
  
  def redirect_to_public
    redirect_to normal_link('contact')
  end
  
  def find_departments
    @department = Department.find_for_union( params[:id], @union.id )
  end
end
