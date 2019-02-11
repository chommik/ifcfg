class ApplicationController < ActionController::Base
  CONSOLE_USER_AGENT = /(Wget|curl)\/.*/

  def set_default_format
    if request.format.to_s == "*/*" and request.headers.fetch("User-Agent", "") =~ CONSOLE_USER_AGENT
      request.format = :text
    end
  end

  before_action :set_default_format
end
