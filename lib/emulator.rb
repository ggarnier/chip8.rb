require_relative "operation"

class Emulator
  attr_reader :registers, :pc

  def initialize
    @registers = [0] * 16
  end

  def exec(instructions)
    @pc = 0
    begin
      operation = Operation.for(instructions[pc])
      if operation.name == 'set'
        registers[operation.reg] = operation.value
      elsif operation.name == 'skip'
        if registers[operation.reg] == operation.value
          @pc += 1
        end
      elsif operation.name == 'jump'
        @pc = operation.address - 1
      elsif operation.name == 'increment'
        registers[operation.reg] += operation.value
      end
      @pc += 1
    end while (operation.name != 'end')
  end
end
