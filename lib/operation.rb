class Operation
  TYPES = []

  def self.inherited subclass
    TYPES << subclass
  end

  def self.valid? instruction
    false
  end

  def self.for instruction
    type = TYPES.find { |type| type.valid?(instruction) }
    type.new
  end
end


class SetOperation < Operation
  def self.valid? instruction
    instruction & 0xf000 == 0x6000
  end
end

class EndOperation < Operation
  def self.valid? instruction
    instruction == 0x0
  end
end

class SkipOperation < Operation
  def self.valid? instruction
    instruction & 0xf000 == 0x3000
  end
end

class JumpOperation < Operation
  def self.valid? instruction
    instruction & 0xf000 == 0x1000
  end
end

class IncrementOperation < Operation
  def self.valid? instruction
    instruction & 0xf000 == 0x7000
  end
end
