module ApplicationHelper

  include SegmentationHelpers, AdminHelpers, LanguageHelpers, LinkHelpers

  def head_bkg
    if @union and @union.header
      {:style => "background: url('#{url_for_file_column(@union, "header", "proper")}') no-repeat"}
    else
      {:style => "background: url('/images/union_sctHead_head.png') no-repeat"}
    end
  end

	def signal_active(what)
		' id="active"' if @section == what
	end
  
  # Display the visitor count with proper language.
  def display_counter
    case @counter.count
		when 1
			"Obiskal nas je #{@counter.count} obiskovalec."
		when 2
			"Obiskala sta nas #{@counter.count} obiskovalca."
		when 3..4
			"Obiskali so nas #{@counter.count} obiskovalci."
		else
			"Obiskalo nas je #{@counter.count} obiskovalcev."
		end
  end
	
	# Determine whether we are in production.
	def production?
    RAILS_ENV == 'production'
  end
	
	# Get the file's extension.
	def file_extension(filename)
	  filename_array = File.basename(filename).split('.')
	  return filename_array[filename_array.size-1]
  end
	
	# Set the page title variable and output a H1 title tag.
	def title(text)
	  @page_title = text
	  content_tag :h1, text
	end
	
	# Determine file kind from extension
	def kind_from_extension(ext)
	  case ext.downcase
    when 'xls', 'ods'
      'excel'
    when 'doc', 'odt', 'docx'
      'word'
    when 'pdf'
      'pdf'
    when 'zip', 'rar', 'arj', 'ace', 'iso'
      'archive'
    when 'jpg', 'jpeg', 'gif', 'png', 'bmp', 'tiff', 'psd'
      'img'
    else
      'file'
    end
	end
	
	# Section definitions
  def in_about?
    [ 
      'about', 
      'contact', 
      'page',
      'gallery', 
      'symbols', 
      'album', 
      'forms',
      'photo' 
    ].include?(@section)
  end
  def in_news?
    [
      'news', 
      'news_div', 
      'news_mv', 
      'news_izd', 
      'news_obv', 
      'news_archive'
    ].include?(@section)
  end
  
  def in_docs?
    return true if @section =~ /docs/
  end
  
  def in_projects?
    return true if @section =~ /project/
  end
  
  # Current resource category determination
  def current_category(c)
    (@section == 'resource' and c.resource_categories.map(&:id).member?(params[:id].to_i)) or (c.id == params[:cat_id].to_i)
  end
end
