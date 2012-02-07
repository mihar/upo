class AdminAdminsController < ApplicationController
  
  before_filter :authenticate
  before_filter :option_hash
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @admins = Admin.paginate :all, :page => params[:page], :per_page => 20, :include => [:union, :subunion]
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:notice] = 'Administrator ustvarjen.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = 'Administrator shranjen.'
    redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  protected
  
  def option_hash
    @options = {'Ne' => false, 'Da' => true}
    @unions = Union.find :all
    @subunions = Subunion.find :all
  end
end
