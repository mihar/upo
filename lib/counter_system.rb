module CounterSystem
  
  
  # Default cookie array (value).
  COUNT_COOKIE_DEFAULTS = { :zdus => false, :union => [0], :subunion => [0] }

  
  def count_visit
    # If cookie not present, make it and jump right into the incrementation.
    unless cookies[:counter]
      make_cookie 
      current_data = COUNT_COOKIE_DEFAULTS
    else
      begin
        # Fetch count data from cookie.
        current_data = Marshal.load cookies[:counter].to_s
      # Rescue data load error for migration to Rails 2.1
      rescue ArgumentError
        cookies[:counter] = nil
        make_cookie
        current_data = COUNT_COOKIE_DEFAULTS
      end
    end


    if in_zdus?
      unless current_data[:zdus] === true
        Counter.increment_for_zdus
        bake_cookie 'zdus', 0, current_data
      end
    end
  
    if in_union?
      unless current_data[:union].member?(params[:union_id])
        Counter.increment_for_union params[:union_id]
        bake_cookie 'union', params[:union_id], current_data
      end
    end
  
    if in_subunion?
      unless current_data[:subunion].member?(params[:subunion_id])
        Counter.increment_for_subunion params[:subunion_id]
        bake_cookie 'subunion', params[:subunion_id], current_data
      end
    end
  end

  # Makes a fresh cookie, right from the owen, when no cookie present.
  def make_cookie
    cookies[:counter] = {
      :value => Marshal.dump( COUNT_COOKIE_DEFAULTS ),
      :expires => 24.hours.from_now
    }
  end

  # Bakes a new cookie value, with the updated data about visited segments.
  def bake_cookie(what, id, current_data)  
    zdus = (what == 'zdus') ? true : false
    union_id = (what == 'union') ? id : false
    subunion_id = (what == 'subunion') ? id : false
  
    if union_id
      current_data[:union] << union_id
    end

    if subunion_id
      current_data[:subunion] << subunion_id
    end
  

    cookies[:counter] = Marshal.dump( { :zdus => zdus, :union => current_data[:union], :subunion => current_data[:subunion]} )
  end

end