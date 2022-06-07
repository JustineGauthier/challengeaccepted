class ConvertDate
  def initialize(attributes = {})
    @date = attributes[:date]
  end

  DAYS = {'sun' => "dimanche", 'mon' => "lundi", 'tue' => "mardi", 'wed' => "mercredi",
    'thu' =>"jeudi", 'fri' => "vendredi", 'sat' => "samedi"}
  MONTHS = {'jan' => "janvier", 'feb' => "février", 'mar' => "mars", 'apr' => "avril",
  'may' => "mai", 'jun' => "juin", 'jul' => "juillet", 'aug' => "août",
  'sep'=> "septembre", 'oct' => "octobre", 'nov' => "novembre", 'dec' => "décembre"}

  def call
   day = DAYS[@date.split.first.downcase]
   number = @date.split[1]
   month = MONTHS[@date.split.last.downcase]
   return "#{day} #{number} #{month}"
  end
end
