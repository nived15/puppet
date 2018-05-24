require 'spec_helper'
describe 'condition' do

  context 'with defaults for all parameters' do
    it { should contain_class('condition') }
  end
end
