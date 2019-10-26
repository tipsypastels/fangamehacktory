module TableHelper
  def tr_key_value(key, value, required: false)
    return unless value.present?
    if value.blank?
      if required
        raise ArgumentError, "#{value} cannot be a value in a required tr_key_value"
      else
        return
      end
    end

    <<~HTML.html_safe
      <tr>
        <th>
          #{key}
        </th>
        
        <td>
          #{value}
        </td>
      </tr>
    HTML
  end
end