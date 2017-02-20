require 'spec_helper'
describe 'awscli' do

  context 'with defaults for all parameters' do
    it { should contain_class('awscli') }
  end
end
