require 'account'

describe Account do
  it { is_expected.to respond_to(:deposit).with(1).argument }
  it { is_expected.to respond_to(:withdraw).with(1).argument }
end
