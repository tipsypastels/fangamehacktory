module DateHelper
  def time_ago_or_date_in_words(time, format: '%Y/%m/%d')
    date = time.to_date

    if date.in? [Date.current, Date.yesterday]
      time_ago_in_words(time, scope: 'datetime.short')
    else
      date.strftime(format)
    end
  end
end