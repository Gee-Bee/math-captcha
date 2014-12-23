require 'math_captcha/base'
require 'math_captcha/configuration'
require 'math_captcha/rails'

module MathCaptcha
  def self.configuration
    @configuration ||= Configuration.new
  end
end
