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

    context 'when numbers are large amount' do
      let(:numbers) { "1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10" }
      it 'returns the sum of the numbers' do
        expect(subject).to eq(165)
      end
    end

    context 'when numbers are a newline-separated string' do
      let(:numbers) { "1\n2\n3" }
      it 'returns the sum of the numbers' do
        expect(subject).to eq(6)
      end
    end

    context 'when numbers are a mix of comma and newline' do
      let(:numbers) { "1\n2,3" }
      it 'returns the sum of the numbers' do
        expect(subject).to eq(6)
      end
    end

     context 'when numbers contain a custom delimiter' do
      let(:numbers) { "//;\n1;2;3" }
      it 'returns the sum of the numbers' do
        expect(subject).to eq(6)
      end
    end

     context 'when numbers contain negative numbers' do
      let(:numbers) { '1,-2,3' }
      it 'raises an error' do
        expect { subject }.to raise_error('Negative numbers not allowed: -2')
      end
    end

    context 'when numbers contain multiple negative numbers' do
      let(:numbers) { '1,-2,-3' }
      it 'raises an error' do
        expect { subject }.to raise_error('Negative numbers not allowed: -2, -3')
      end
    end

    context 'when numbers contain a mix of positive and negative numbers' do
      let(:numbers) { '1,-2,3,-4' }
      it 'raises an error' do
        expect { subject }.to raise_error('Negative numbers not allowed: -2, -4')
      end
    end

    context 'when numbers contain a mix of positive and negative numbers with custom delimiter' do
      let(:numbers) { '//:\n1:-2:3:-4' }
      it 'raises an error' do
        expect { subject }.to raise_error('Negative numbers not allowed: -2, -4')
      end
    end

    context 'when number has a value greater than 1000' do
      let(:numbers) { '1001,2' }
      it 'ignores the number greater than 1000' do
        expect(subject).to eq(2)
      end
    end

    context 'when number has a value greater than 1000 with custom delimiter' do
      let(:numbers) { '//:\n1001:2:3' }
      it 'ignores the number greater than 1000' do
        expect(subject).to eq(5)
      end
    end

    context 'when number has a value greater than 1000 with custom delimiter and negative numbers' do
      let(:numbers) { '//:\n1001:-2:3:-4' }
      it 'raises an error' do
        expect { subject }.to raise_error('Negative numbers not allowed: -2, -4')
      end
    end
  end
end