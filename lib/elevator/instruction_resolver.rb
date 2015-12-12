module Elevator
  class InstructionResolver
    def initialize(shaft_state)
      @shaft_state = shaft_state
    end

    def next_instruction
      shaft_state.instructions[0] || Instructions::Stop.new
    end

    private
    attr_reader :shaft_state
  end
end
