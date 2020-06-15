require 'account'

describe Account do
  let(:subject) { described_class.new(transaction)}
  let(:transaction) { class_double 'Transaction' }

  it { is_expected.to respond_to(:deposit).with(1).argument }
  it { is_expected.to respond_to(:withdraw).with(1).argument }

  it 'has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end

  describe '#deposit' do
    it 'adds to the balance the amount provided as argument' do
      expect { subject.deposit(1000) }.to change(subject, :balance).by 1000
    end
  end

  describe '#withdraw' do
    it 'deducts from the balance the amount provided as argument' do
      subject.deposit(1000)

      expect { subject.withdraw(500) }.to change(subject, :balance).by -500
    end

    context 'when insufficient funds' do
      it 'raises an error' do
        error = 'Insufficient funds!'
        subject.deposit(500)

        expect { subject.withdraw(550) }.to raise_error error
      end
    end
  end
end
