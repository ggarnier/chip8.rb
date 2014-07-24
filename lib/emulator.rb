require_relative "operation"

class Emulator
  attr_reader :registers, :pc

  def initialize
    @registers = [0] * 16
  end

  def exec(instructions)
    @pc = 0
    loop do
      operation = Operation.for(instructions[pc])

      case operation.name
      when 'set'
        registers[operation.register] = operation.value
      when 'skip'
        if registers[operation.register] == operation.value
          @pc += 1
        end
      when 'jump'
        @pc = operation.address - 1
      when 'increment'
        registers[operation.register] += operation.value
      when 'end'
        break
      end

      @pc += 1
    end
  end
end
