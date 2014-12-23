require 'math_captcha/helpers/view_helpers'
require 'math_captcha/helpers/controller_helpers'

module MathCaptcha
  class Engine < ::Rails::Engine

    config.after_initialize do
      ActionView::Base.send(:include, ::MathCaptcha::ViewHelpers)
      ActionController::Base.send(:include, ::MathCaptcha::ControllerHelpers)
    end

  end
end
