# frozen_string_literal: true
class StringCalculator

  DEFAULT_DELIMITER = /,|\n/

  def add(numbers)
    begin
      return 0 if numbers.nil? || numbers&.empty?

      delimiter = DEFAULT_DELIMITER
      if numbers&.start_with?("//")
        delimiter = numbers[2] || DEFAULT_DELIMITER
        numbers = numbers[4..]
      end
      extracted_numbers = numbers&.split(delimiter).map(&:to_i)
      return 0 if extracted_numbers.nil?

      raise "Negative numbers not allowed: #{negative_numbers(extracted_numbers).join(', ')}" if negative_numbers(extracted_numbers).any?

      extracted_numbers.reject { |n| n > 1000 }.sum
    rescue StandardError => e
      raise e.message
    end
  end

  private

  def negative_numbers(numbers)
    numbers.select(&:negative?)
  end
end
