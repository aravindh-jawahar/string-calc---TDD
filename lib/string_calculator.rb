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

      extracted_numbers.sum
    rescue StandardError => e
      raise e.message
    end
  end
end
