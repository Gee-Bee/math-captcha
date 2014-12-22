require 'ezcrypto'

module MathCaptcha
  class Base
    attr_reader :a, :b, :operator

    def initialize
      @a        = ::MathCaptcha.configuration.a_opnds.sample
      @b        = ::MathCaptcha.configuration.b_opnds.sample
      @operator = ::MathCaptcha.configuration.operators.sample
    end

    def initialize_from(secret)
      yml = YAML.load(key.decrypt64(secret))
      @a, @b, @operator = yml[:a], yml[:b], yml[:operator]
    end

    def correct?(value)
      result == value.to_i
    end

    def encrypt
      key.encrypt64 to_yaml
    end

    def self.decrypt(secret)
      result = new
      result.initialize_from secret
      result
    end

    def question
      "#{@a} #{@operator.to_s} #{@b} = ?"
    end

    protected

    def to_yaml
      YAML::dump({
        :a        => @a,
        :b        => @b,
        :operator => @operator
      })
    end

    private

    def key
      EzCrypto::Key.with_password ::MathCaptcha.configuration.cipher_key, ::MathCaptcha.configuration.cipher_salt
    end

    def result
      @a.send @operator, @b
    end
  end
end
