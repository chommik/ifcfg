module IpHelper
  def format_header_name(header)
    header.split('_').map(&:capitalize).join('-')
  end
end
