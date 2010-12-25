module ApplicationHelper
  def portrait(char, size = 90)
    content_tag(:div, '', :class => 'portrait', :style => "background: url('/images/portraits-#{char.portrait_id}-#{size}.jpg') -#{char.portrait_col * size}px -#{char.portrait_row * size}px no-repeat; width: #{size}px; height: #{size}px;")
  end
end
