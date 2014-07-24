class Operation
  TYPES = []

  attr_reader :name, :reg, :address, :instruction

  def self.inherited subclass
    TYPES << subclass
  end

  def self.valid? instruction
    false
  end

  def self.for instruction
    type = TYPES.find { |type| type.valid?(instruction) }
    type.new(instruction)
  end

  def initialize instruction
    @instruction = instruction
  end

  def value
    @value = 0x00ff & instruction
  end
end


class SetOperation < Operation
  def initialize instruction
    super
    @name = 'set'
    @reg = (0x0f00 & instruction) >> 8
  end

  def self.valid? instruction
    instruction & 0xf000 == 0x6000
  end
end

class EndOperation < Operation
  def initialize instruction
    super
    @name = 'end'
  end

  def self.valid? instruction
    instruction == 0x0
  end
end

class SkipOperation < Operation
  def initialize instruction
    super
    @name = 'skip'
    @reg = (0x0f00 & instruction) >> 8
  end

  def self.valid? instruction
    instruction & 0xf000 == 0x3000
  end
end

class JumpOperation < Operation
  def initialize instruction
    super
    @name = 'jump'
    @address = 0x0fff & instruction
  end

  def self.valid? instruction
    instruction & 0xf000 == 0x1000
  end
end

class IncrementOperation < Operation
  def initialize instruction
    super
    @name = 'increment'
    @reg = (0x0f00 & instruction) >> 8
  end

  def self.valid? instruction
    instruction & 0xf000 == 0x7000
  end
end
