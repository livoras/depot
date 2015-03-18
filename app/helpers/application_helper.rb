module ApplicationHelper

  def hide_div_if(condition, attributes={}, &block)
    if condition
      attributes[:style] = "display: none;"
    end
    content_tag("div", attributes, &block)
  end

  def say_shit(name)
    "#{name} : shit!!"
  end

end
