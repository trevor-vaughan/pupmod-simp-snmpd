require 'spec_helper'

describe 'snmpd::informsink' do
  on_supported_os.each do |os, base_facts|
    let(:facts) do
      base_facts.merge({ :interfaces => 'eth0' })
    end

    context "on #{os}" do
      let(:title) {'test_informsink'}
      let(:params) {{
        :community => 'test_community',
        :port      => '12345'
      }}

      it { should compile.with_all_deps }
      it { should create_concat_fragment('snmpd+test_informsink.inform.sink') }
      it { should contain_class('snmpd') }
    end
  end
end
