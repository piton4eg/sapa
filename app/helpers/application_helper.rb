module ApplicationHelper
  def full_title(page_title)
    base_title = "SAPA - Photo by Olga Markova"
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  def current_link_to(label, path)
    content_tag('li', link_to(label, path), class: (current_page?(path) ? "active" : nil))
  end
end
