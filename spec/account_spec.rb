require 'account'

describe Account do
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
      expect { subject.withdraw(500) }.to change(subject, :balance).by -500
    end
  end
end
