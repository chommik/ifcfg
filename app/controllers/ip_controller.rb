class IpController < ApplicationController
  def ip
    set_ip
    set_host
  end

  def host
    set_ip
    set_host
  end

  def headers
    set_headers
  end

  def all
    set_ip
    set_host
    set_headers
  end

  private
  def set_headers
    header_names = request.each_header.filter do |name, _|
      name.starts_with? "HTTP"
    end

    @headers = header_names.to_h { |name, _| [name[5..], request.headers.fetch(name)] }
    @headers.except! "VERSION"
  end

  def set_host
    @host = Resolv.getname request.remote_ip
  rescue Resolv::ResolvError
    @host = '_UNKNOWN_'
  end

  def set_ip
    @ip = request.remote_ip
  end
end
