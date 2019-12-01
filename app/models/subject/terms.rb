module Subject::Terms
  delegate :css_class, :human_name, :term, :icon,
    to: :subjected
end