module ApplicationHelper
  def portrait(char, size = 90)
    content_tag(:div, :class => 'portrait-container') do
      content_tag(:div, '', :class => 'portrait', :style => "background: url('/images/portraits-#{char.portrait_id}-#{size}.jpg') -#{char.portrait_col * size}px -#{char.portrait_row * size}px no-repeat; width: #{size}px; height: #{size}px;") +
        content_tag(:div, '', :class => 'portrait-frame') +
        race_icon(char)
    end
  end

  def race_icon(char)
    offset = if char.random?
               3
             else
               case char.race
               when 'protoss'
                 2
               when 'zerg'
                 1
               else
                 0
               end
             end

    content_tag(:div, '', :class => 'race-icon', :style => "background: url('/images/race-symbols.png') 0px -#{offset * 50}px no-repeat; width: 30px; height: 30px;")
  end
end
