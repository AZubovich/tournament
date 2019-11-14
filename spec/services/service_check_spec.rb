require 'spec_helper'
require 'rails_helper'

describe ServiceCheck do
  it 'get a OK! message' do
    distr = '0.4,0.35,0.25'
    expect(ServiceCheck.check_args(distr, '3', '8')).to eq('OK!')
  end
  it 'get a error message' do
    distr = '0.45,0.45,0.45'
    expect(ServiceCheck.check_args(distr, '3', '8')).to eq('Uncorrect distribution')
  end
  it 'count sum of the prize' do
    distr = '0.45,0.35.,0.2'
    expect(ServiceCheck.check_prize(distr)).to eq(1.0)
  end
end
