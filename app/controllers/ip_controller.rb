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
    @headers = request.headers
                   .find_all {|name, value| name.starts_with? 'HTTP_' and not name == 'HTTP_VERSION'}
                   .map {|name, value| [name[5..-1], value]}
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
