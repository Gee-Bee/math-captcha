require 'math_captcha/base'
require 'math_captcha/configuration'

module MathCaptcha
  def self.configuration
    @configuration ||= Configuration.new
  end
end
