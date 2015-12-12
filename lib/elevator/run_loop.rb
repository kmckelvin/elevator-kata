module Elevator
  class RunLoop
    def tick(shaft_state)
      shaft_state = shaft_state.dup
      next_instruction = InstructionResolver.new.next_instruction(shaft_state)
      next_step = next_instruction.next_step(shaft_state)
      next_shaft_state = next_step.apply(shaft_state)
      remove_fulfilled_instructions(next_shaft_state)
      next_shaft_state
    end

    private
    def remove_fulfilled_instructions(shaft_state)
      shaft_state.instructions.reject! { |i| i.is_fulfilled?(shaft_state) }
    end
  end
end
