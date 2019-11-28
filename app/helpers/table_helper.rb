module TableHelper
  def tr_key_value(key, value = nil, required: false, **opts, &block)
    if value.blank?
      if required && !block_given?
        raise ArgumentError, "#{value} cannot be a value in a required tr_key_value"
      elsif block_given?
        value = capture(&block)
      else
        return
      end
    end

    <<~HTML.html_safe
      <tr class="#{opts.delete(:class)}">
        <th class="#{opts.delete(:th_class)}">
          #{key}
        </th>
        
        <td class="#{opts.delete(:td_class)}">
          #{value}
        </td>
      </tr>
    HTML
  end
end