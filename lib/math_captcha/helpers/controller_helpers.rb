module MathCaptcha
  module ControllerHelpers
    def verify_math_captcha
      @math_captcha_valid ||= begin
        @captcha = ::MathCaptcha::Base.decrypt(params[:captcha_secret])

        if @captcha.correct?(params[:captcha_answer])
          true
        else
          @captcha_incorrect = true
          false
        end
      end
    end
    alias_method :math_captcha_valid?, :verify_math_captcha
  end
end
