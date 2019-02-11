module ApplicationHelper
  def url_link(dest, options={})
    link_to dest, dest, options
  end
end
