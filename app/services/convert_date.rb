class ConvertDate
  def initialize(attributes = {})
    @date = attributes[:date]
  end

  DAYS = {'sun' => "dim", 'mon' => "lun", 'tue' => "mar", 'wed' => "mer",
    'thu' =>"jeu", 'fri' => "ven", 'sat' => "sam"}
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
