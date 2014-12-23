module MathCaptcha
  module ViewHelpers
    def math_captcha_tags
      @captcha ||= ::MathCaptcha::Base.new
      field_set_tag 'Captcha', class: 'math-captcha' do
        prompt = content_tag(:span, I18n.t(:prompt, scope: :math_captcha), class: 'prompt')
        operation = content_tag(:span,
          hidden_field_tag(:captcha_secret, @captcha.encrypt) +
          label_tag(:captcha_answer, @captcha.question) +
          text_field_tag(:captcha_answer, params[:captcha_answer]),
        class: 'operation')
        error = @captcha_incorrect ? I18n.t('math_captcha.message') : ''
        prompt + operation + error
      end
    end
  end
end
