module MathCaptcha
  module ViewHelpers
    def math_captcha_tags
      @captcha ||= ::MathCaptcha::Base.new
      field_set_tag 'Captcha', class: 'math-captcha' do
        prompt = content_tag(:div, I18n.t(:prompt, scope: :math_captcha), class: 'prompt')
        operation_content = ::ActiveSupport::SafeBuffer.new
        operation_content << hidden_field_tag(:captcha_secret, @captcha.encrypt)
        operation_content << label_tag(:captcha_answer, @captcha.question)
        operation_content << number_field_tag(:captcha_answer, params[:captcha_answer],
          max: ::MathCaptcha.configuration.a_opnds.max * ::MathCaptcha.configuration.b_opnds.max)
        operation_content << content_tag(:div, I18n.t('math_captcha.message'), class: 'error') if @captcha_incorrect
        operation = content_tag(:div,operation_content, class: 'operation')
        prompt + operation
      end
    end
  end
end
