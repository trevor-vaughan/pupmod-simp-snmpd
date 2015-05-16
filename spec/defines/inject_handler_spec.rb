require 'spec_helper'

describe 'snmpd::inject_handler' do

  let(:title) {'test_inject_handler'}
  let(:params) {{
    :handler_type => 'debug',
    :modulename   => 'test_module'
  }}
  base_facts = {
    :interfaces => 'eth0'
  }
  let(:facts){base_facts}

  it { should compile.with_all_deps }
  it { should contain_class('snmpd') }
  it { should create_concat_fragment('snmpd+test_inject_handler.debug.inject') }
end
