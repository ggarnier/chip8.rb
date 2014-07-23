require 'minitest/autorun'
require_relative '../lib/emulator'
require_relative '../lib/operation'

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end
