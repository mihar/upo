module SegmentationHelpers
  
  def segment_id_field(model_name=nil, form=nil)
    unless @segment.blank?
      unless segment.nil?
  	    if form
          return form.hidden_field("#{segment}_id")
        else
          return hidden_field(model_name, "#{segment}_id")
        end
      end
    end
  end
  def segment_file_field(field, model_name=nil)
    if model_name.nil?
  	  file_column_field(segment, field)
  	else
  	  file_column_field(model_name, field)
  	end
  end
  def segment_model_id_field()
   return hidden_field('news_file', 'news_id') unless params[:news_id].nil?
   return hidden_field('news_file', 'actuality_id') unless params[:actuality_id].nil?
   return hidden_field('news_file', 'public_relation_id') unless params[:public_relation_id].nil?
   return hidden_field('news_file', 'izdela_id') unless params[:izdela_id].nil?
  end
  def segment_model_route
   return 'news' unless params[:news_id].nil?
   return 'aktualno' unless params[:actuality_id].nil?
   return 'zamedije' unless params[:public_relation_id].nil?
   return 'izdela' unless params[:izdela_id].nil?
  end
  def segment_model_name
   return 'news' unless params[:news_id].nil?
   return 'actuality' unless params[:actuality_id].nil?
   return 'public_relation' unless params[:public_relation_id].nil?
   return 'izdela' unless params[:izdela_id].nil?
  end
  def segment_model
    return @news unless params[:news_id].nil?
    return @actuality unless params[:actuality_id].nil?
    return @public_relation unless params[:public_relation_id].nil?
    return @izdela unless params[:izdela_id].nil?
  end
  def segment_model_reference
   return :news_id unless params[:news_id].nil?
   return :actuality_id unless params[:actuality_id].nil?
   return :public_relation_id unless params[:public_relation_id].nil?
   return :izdela_id unless params[:izdela_id].nil?
  end
  def segment_model_id
    return params[:news_id] unless params[:news_id].nil?
    return params[:actuality_id] unless params[:actuality_id].nil?
    return params[:public_relation_id] unless params[:public_relation_id].nil?
    return params[:izdela_id] unless params[:izdela_id].nil?
  end
  
end