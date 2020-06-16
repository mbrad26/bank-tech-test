require 'printer'

describe Printer do
  let(:subject) { described_class.new(transaction) }
  let(:transaction) { class_double "Transaction" }

  it { is_expected.to respond_to :print_statement }
end
