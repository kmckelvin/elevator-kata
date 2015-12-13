require 'delegate'

module Elevator
  class FloorNavigator
    def initialize(floors)
      @floors = floors
    end

    def floor_above(floor)
      next_floor_index = floors.index(floor) + 1
      floors[next_floor_index]
    end

    def floor_below(floor)
      next_floor_index = floors.index(floor) - 1
      floors[next_floor_index]
    end

    def directional_distance_between(first, second)
      first_index = floors.index(first)
      second_index = floors.index(second)

      second_index - first_index
    end

    def distance_between(first, second)
      directional_distance_between(first, second).abs
    end

    private
    attr_reader :floors
  end
end
