require 'spec_helper'
describe 'webtest' do

  context 'with defaults for all parameters' do
    it { should contain_class('webtest') }
  end
end
