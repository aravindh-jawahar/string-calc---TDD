# frozen_string_literal: true
class StringCalculator
  attr_accessor :numbers

  def initialize(numbers = nil)
    @numbers = numbers
  end

  def add(numbers)
    return if numbers.blank?

    numbers.split(',').sum
  end
end
