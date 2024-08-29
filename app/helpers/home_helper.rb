module HomeHelper
  def show_text_keys(texts)
    text_str = ""
    Text::SUB_CATEGORIES.each do |category, sub_categories|
      text_str += "<div><div class='setting.header'><h3>#{category.to_s.titleize}</h3></div><ul class='list-inline d-flex'>"
      sub_categories.each do |section, keys|
        keys.each do |key, value|
          text = texts.find_by(key: key)
          text_str += "<li class='mx-1'>#{link_to value, get_path(text, category, section, key), remote: true, class: button_class(text, category, section, key)} </li>"
        end
      end
      text_str += "</ul>"
    end
    text_str += "</div>"
    text_str.html_safe
  end

  def button_class(text, category, section, key)
    if text
      'btn btn-success'
    else
      'btn btn-danger'
    end
  end

  def get_path(text, category, section, key)
    if text
      edit_text_path(text, path: root_path)
    else
      new_text_path(text: {category: category, section: section, key: key}, path: root_path)
    end
  end
end