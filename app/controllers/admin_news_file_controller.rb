class AdminNewsFileController < ApplicationController
	
	before_filter :authenticate_section, :set_segment
	before_filter :setup_new_file, :only => [:new_file, :new_image]
  layout :determine_layout

  def create
    @news_file = NewsFile.new(params[:news_file])
    @news = @news_file.news

    if @news_file.save
      flash[:notice] = 'Novica je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def edit
    options = {:include => :news_files}
    if in_union?
      @news = News.find_for_union( params[:id], @union.id, options )
    elsif in_subunion?
      @news = News.find_for_subunion( params[:id], params[:subunion_id], options )
    elsif in_zdus?
      @news = News.find_for_zdus( params[:id], options )
    end
  end
  
  def destroy
    @news_file = NewsFile.find(params[:id])
    @news = @news_file.news
    if @news_file.destroy
      flash[:notice] = 'Priponka odstranjena.'
    else
      flash[:notice] = 'Napaka pri brisanju priponke!'
    end
    
    redirect_to_section
  end
  
  protected
  
  def redirect_to_section
    options = {:action => 'edit', :id => @news}
  	if in_union?
      redirect_to admin_u_news_file_path(options)
    elsif in_subunion?
      redirect_to admin_subu_news_file_path(options)
    elsif in_zdus?
      redirect_to admin_zdus_news_file_path(options)
    end
  end
  
  def setup_new_file
    @news = News.find params[:id]
    @news_file = NewsFile.new
    @news_file.news_id = params[:id]
  end
  
end
