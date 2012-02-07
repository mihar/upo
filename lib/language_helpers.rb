module LanguageHelpers

  def stevilo_priponk(enclosure)
    sklanjaj_priponke_s_stevilom(enclosure.news_files.size)
  end
  def sklanjaj_priponke_s_stevilom(n)
  	case n
  	when 1
  		"#{n} priponka"
  	when 2
  		"#{n} priponki"
  	when 3..4
  		"#{n} priponke"
  	else
  		"#{n} priponk"			
  	end
  end
  
end