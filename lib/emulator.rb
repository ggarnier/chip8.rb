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
        registers[operation.register] = operation.value
      elsif operation.name == 'skip'
        if registers[operation.register] == operation.value
          @pc += 1
        end
      elsif operation.name == 'jump'
        @pc = operation.address - 1
      elsif operation.name == 'increment'
        registers[operation.register] += operation.value
      end
      @pc += 1
    end while (operation.name != 'end')
  end
end
