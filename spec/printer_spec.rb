require 'printer'

describe Printer do
  it { is_expected.to respond_to :print_statement }
end
