module CounterSystem
  def count_visit
    # Ignore them bots.
    return if request.env["HTTP_USER_AGENT"] =~ /bot/

    # If cookie not present, make it and jump right into the incrementation.
    unless cookies[:upo_counter]
      make_cookie
      Counter.increment_for_union @union.id
    end
  end
  
  # Makes a fresh cookie, right from the owen, when no cookie present.
  def make_cookie
    cookies[:upo_counter] = {
      :value => @union.permalink,
      :expires => 7.days.from_now,
      :domain => request.host
    }
  end
end