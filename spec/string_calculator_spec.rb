require 'string_calculator'

RSpec.describe StringCalculator do
  let(:subject) { described_class.new.add(numbers) }
  let(:numbers) { "1,2" }

  describe '#add' do
    context 'when numbers are empty' do
      let(:numbers) { "" }
      it 'returns 0' do
        expect(subject).to eq(0)
      end
    end

    context 'when numbers are nil' do
      let(:numbers) { nil }
      it 'returns 0' do
        expect(subject).to eq(0)
      end
    end

    context 'when numbers are a single number' do
      let(:numbers) { "5" }
      it 'returns the number itself' do
        expect(subject).to eq(5)
      end
    end

    context 'when numbers are a comma-separated string' do
      let(:numbers) { "1,2" }
      it 'returns the sum of the numbers' do
        expect(subject).to eq(3)
      end
    end
  end
end