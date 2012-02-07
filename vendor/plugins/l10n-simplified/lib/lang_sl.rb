# lang_en.rb
# English baseline translation file. Comes in handy for testing purposes



module LocalizationSimplified
  About = {
    :lang => "sl",
    :updated => "2007-09-30"
  }

  class ActiveRecord
    # ErrorMessages to override default messages in 
    # +ActiveRecord::Errors::@@default_error_messages+
    # This plugin also replaces hardcoded 3 text messages 
    # :error_translation is inflected using the Rails 
    # inflector. 
    #
    # Remember to modify the Inflector with your localized translation
    # of "error" and "errors" in the bottom of this file
    # 
    ErrorMessages = {
      :inclusion           => "ni vključen v seznamu",
      :exclusion           => "je rezervirano",
      :invalid             => "je nepravilno",
      :confirmation        => "se ne ujema s potrditvijo",
      :accepted            => "mora biti sprejet",
      :empty               => "ne more biti prazno",
      :blank               => "ne more biti prazno",# alternate formulation: "is required"
      :too_long            => "je predolgo (največja dolžina je %d znakov)",
      :too_short           => "je prekratko (najmanjša dolžina je %d znakov)",
      :wrong_length        => "je napačne dolžine (mora biti točno %d znakov)",
      :taken               => "je že zasedeno",
      :not_a_number        => "ni številka",
      #Jespers additions:
      :error_translation   => "napaka",
      :error_header        => "%s preprečuje, da bi shranili %s",
      :error_subheader     => "Problematična so naslednja polja:"
    }
  end

  # Texts to override +distance_of_time_in_words()+
  class DateHelper
    Texts = {
      :less_than_x_seconds => "manj kot %d sekund",
      :half_a_minute       => "pol minute",
      :less_than_a_minute  => "manj kot minuta",
      :one_minute          => "1 minuta",
      :x_minutes           => "%d minut",
      :one_hour            => "okrog ene ure",
      :x_hours             => "okrog %d ur",
      :one_day             => "1 dan",
      :x_days              => "%d dni",
      :one_month           => "1 mesec",
      :x_months            => "%d mesecev",
      :one_year            => "1 leto",
      :x_years             => "%d let"
    }

    # Rails uses Month names in Date and time select boxes 
    # (+date_select+ and +datetime_select+ )
    # Currently (as of version 1.1.6), Rails doesn't use daynames
    Monthnames     = [nil] + %w{januar februar marec april maj junij julij avgust september oktober november december}
    AbbrMonthnames = [nil] + %w{jan feb mar apr may jun jul avg sep okt nov dec}
    Daynames       = %w{nedelja ponedeljek torek sreda Četrtek petek sobota}
    AbbrDaynames   = %w{ned pon tor sre cet pet zob}
    
    # Date and time format syntax explained in http://www.rubycentral.com/ref/ref_c_time.html#strftime
    # These are sent to strftime that Ruby's date and time handlers use internally
    # Same options as php (that has a better list: http://www.php.net/strftime )
    DateFormats = {
    	:default	=> "%Y-%m-%d",
      :short    => "%e. %b",
      :long     => "%e. %B, %Y"
    }

    TimeFormats = {
      :default  => "%a, %d. %b %Y %H:%M:%S",
      :short    => "%d. %b %H:%M",
      :long     => "%d. %B, %Y %H:%M"
    }
    # Set the order of +date_select+ and +datetime_select+ boxes
    # Note that at present, the current Rails version only supports ordering of date_select boxes
    DateSelectOrder = {
      :order    => [:day, :month, :year] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    # CurrencyOptions are used as default for +Number#to_currency()+
    # http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#M000449
    CurrencyOptions = {
      :unit      => "€",
      :separator => ",",             #unit separator (between integer part and fraction part)
      :delimiter => ".",             #delimiter between each group of thousands. Example: 1.234.567 
      :order     => [:unit, :number] #order is at present unsupported in Rails
      #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
    }
  end

  class ArrayHelper
    # Modifies +Array#to_sentence()+
    # http://api.rubyonrails.org/classes/ActiveSupport/CoreExtensions/Array/Conversions.html#M000274
    ToSentenceTexts = {
      :connector => 'in',
      :skip_last_comma => false
    }
  end
end


# Use the inflector below to pluralize "error" from
# @@default_error_messages[:error_translation] above (if necessary)
#Inflector.inflections do |inflect|
#	inflect.plural /^(ox)$/i, '\1en'
#	inflect.singular /^(ox)en/i, '\1'
#	inflect.irregular 'person people'
#	inflect.uncountable %w( information )
#end
