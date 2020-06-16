require 'transaction.rb'

describe Transaction do
  subject { described_class }

  describe '.add_to_transactions' do
    it 'records the transactions' do
      subject.add_to_transactions(100, '', 150)

      expect(subject.class_variable_get(:@@transactions)).to include instance_of subject
    end
  end
end
