class AdminDocsController < ApplicationController

  before_filter :authenticate_zdus
  before_filter :find_doc, :except => [:new, :create]
  before_filter :find_doc_categories, :only => [:new, :edit]

  def new
    @doc = Doc.new
    @doc.doc_category_id = params[:doc_category_id]
  end

  def create
    @doc = Doc.new(params[:doc])
    if @doc.save
      flash[:notice] = 'Dokument uspešno shranjen.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @doc.update_attributes(params[:doc])
      flash[:notice] = 'Dokument uspešno osvežen.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @doc.find(params[:id]).destroy
      flash[:notice] = 'Dokument izbrisan!'
    end
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    redirect_to zdus_docs_read_path params[:doc][:doc_category_id]
  end
  
  def find_doc
    @doc = Doc.find(params[:id])    
  end
  
  def find_doc_categories
    @doc_categories = DocCategory.find :all
  end
end
