module Subject::Terms
  delegate :css_class, :human_name, :term,
    to: :subjected
end