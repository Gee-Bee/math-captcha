module MathCaptcha
  class Configuration
    attr_accessor :cipher_key, :cipher_salt,
      :a_opnds, :b_opnds, :operators

    def initialize
      @cipher_key  = SecureRandom.random_bytes(64)
      @cipher_salt = SecureRandom.random_bytes(64)
      @a_opnds = (1..10).to_a
      @b_opnds = (1..10).to_a
      @operators = [:+, :*]
    end
  end
end
