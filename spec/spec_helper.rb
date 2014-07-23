require 'minitest/autorun'
require_relative '../lib/emulator'

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end
