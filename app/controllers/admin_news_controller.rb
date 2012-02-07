class AdminNewsController < ApplicationController
	
	before_filter :authenticate_section, :set_segment, :prepare_options
  before_filter :find_news_for_section, :only => [:edit, :update, :destroy]
  layout :determine_layout
  
  def new
    @news = News.new
    @news.union_id = @union.id
  end

  def create
    @news = News.new(params[:news])
    if @news.save
      flash[:notice] = 'Novica je bila uspešno ustvarjena.'
      redirect_to_section
    else
      render :action => 'new'
    end
  end

  def update
    if @news.update_attributes(params[:news])
      flash[:notice] = 'Novica je bila uspešno shranjena.'
      redirect_to_section
    else
      render :action => 'edit'
    end
  end

  def destroy
    if @news.destroy
      flash[:notice] = 'Novica odstranjena.'
    else
      flash[:notice] = 'Napaka pri brisanju novice!'
    end
    
    redirect_to_section
  end
  
  protected
  
  def find_news_for_section
    @news = News.find_for_union( params[:id], @union.id )
  end
  
  def redirect_to_section
  	redirect_to normal_news_link
  end

  def prepare_options
    @options = {"Prispevki članov" => 'pc', "Obvestila" => 'obv'}
  end
  
end
