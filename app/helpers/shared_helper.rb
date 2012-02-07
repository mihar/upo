module SharedHelper
  def sklanjaj_fotografije(n)
    case n
    when 1
      "fotografija"
    when 2
      "fotografiji"
    when 3..4
      "fotografije"
    else
      "fotografij"
    end
  end
	
	# Outpus link with the basename of the filename, shortened to 16 letters, with a span inside, for incremental viewing.
	def short_file_name_with_span(model)
	  file_name = File.basename(url_for_file_column(model, 'filedata'))
	  short_part = truncate(file_name, 16)
	  long_part_with_span = content_tag :span, file_name
	  
	  return short_part + long_part_with_span
  end
  
  
	def sklanjaj_obiske_s_stevilom(n)
		case n
		when 1
			"#{n} obisk"
		when 2
			"#{n} obiska"
		when 3..4
			"#{n} obiski"
		else
			"#{n} obiskov"			
		end
	end
	
end
