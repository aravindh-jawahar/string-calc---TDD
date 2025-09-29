# frozen_string_literal: true
class StringCalculator

  DEFAULT_DELIMITER = /,|\n/

  def add(numbers)
    begin
      return 0 if numbers.nil? || numbers&.empty?

      delimiters = DEFAULT_DELIMITER
      if numbers&.start_with?('//')
        extracted_numbers = extract_numbers(numbers)&.map(&:to_i)
      else
        extracted_numbers = numbers&.split(delimiters).map(&:to_i)
      end

      return 0 if extracted_numbers.nil?

      raise "Negative numbers not allowed: #{negative_numbers(extracted_numbers).join(', ')}" if negative_numbers(extracted_numbers).any?

      extracted_numbers.reject { |n| n > 1000 }.sum
    rescue StandardError => e
      raise e.message
    end
  end

  private

  def extract_numbers(numbers)
    numbers = numbers[2..]
    delimiters_part, numbers_part = numbers.split("\n")
    if delimiters_part.start_with?('[')
      delimiters = delimiters_part[1..-2].split('][')
    else
      delimiters = [delimiters_part]
    end
    split_by_delimiters(numbers_part, delimiters)
  end

  def split_by_delimiters(str, delimiters)
    escaped = delimiters.map { |d| Regexp.escape(d) }
    pattern = Regexp.new(escaped.join('|'))
    str.split(pattern)
  end

  def negative_numbers(numbers)
    numbers.select(&:negative?)
  end
end
