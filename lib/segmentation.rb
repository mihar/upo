module Segmentation
  
  # Master segment setter.
  def set_segment
    set_segment_union #if in_union?
    # set_segment_subunion if in_subunion?
    # set_segment_zdus if in_zdus?
  end
  
  # Set segment of site.
  def set_segment_zdus
    @segment = 'zdus'
  end
  def set_segment_union
    @segment = 'u'
  end
  def set_segment_subunion
    @segment = 'subu'
  end
  def set_segment_tecum
    @segment = 'tecum'
  end
  
  # Segment helpers.
  def in_zdus?
    false #(not in_subunion? and not in_union?)
  end
  def in_union?
    true #(not params[:union_id].nil?)
  end
  def in_subunion?
    false #(not params[:subunion_id].nil?)
  end
  
	# Return segment
  def segment
    return 'union'
	end
	
	# Layout based on segment
	def determine_layout
    "union"
  end
end