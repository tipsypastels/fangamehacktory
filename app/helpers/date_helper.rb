module DateHelper
  def time_ago_or_date_in_words(time)
    date = time.to_date

    if date.in? [Date.current, Date.yesterday]
      time_ago_in_words(time, scope: 'datetime.short')
    else
      date.strftime('%Y/%m/%d')
    end
  end
end