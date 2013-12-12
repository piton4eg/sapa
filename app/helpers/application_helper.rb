module ApplicationHelper
  def full_title(page_title)
    base_title = 'Маркова Ольга'
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end

  def current_link_to(label, path)
    content_tag('li', link_to(label, path), class: (current_page?(path) ? "active" : nil))
  end

  def logged_in?
    session[:user_id].present?
  end
end
