require 'test_helper'

class MathCaptchaTest < ActiveSupport::TestCase
  def setup
    @mc = MathCaptcha::Base.new
  end

  def set_state
    @mc.instance_eval do
      @a = 2; @b = 3; @operator = :+
    end
  end

  test 'initialize' do
    assert MathCaptcha.configuration.a_opnds.include? @mc.a
    assert MathCaptcha.configuration.b_opnds.include? @mc.b
    assert MathCaptcha.configuration.operators.include? @mc.operator
  end

  test 'correct?' do
    set_state
    assert @mc.correct?('5')
    @mc.instance_eval '@operator = :*'
    assert @mc.correct?(6)
  end

  test 'ecryption and decryption' do
    set_state
    mc2 = MathCaptcha::Base.decrypt @mc.encrypt
    assert_equal @mc.a, mc2.a
    assert_equal @mc.b, mc2.b
    assert_equal @mc.operator, mc2.operator
  end
end
