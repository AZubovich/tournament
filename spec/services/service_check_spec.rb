require 'spec_helper'
require 'rails_helper'

describe ServiceCheck do
  it 'get a OK! message' do
    distr = '1000,700,300'
    expect(ServiceCheck.check_args(distr, '3', '8', '2000')).to eq('OK!')
  end
  it 'get a error message' do
    distr = '1000,700,700'
    expect(ServiceCheck.check_args(distr, '3', '8', '2000')).to eq('Prize and distribution are not equal')
  end
  it 'count sum of the prize' do
    distr = '1000,700,700'
    expect(ServiceCheck.check_prize(distr)).to eq(2400)
  end
end
