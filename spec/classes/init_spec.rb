require 'spec_helper'
describe 'gradle' do

  let(:facts) do
    {
      :osfamily                  => 'Debian',
      :operatingsystem           => 'Debian',
      :operatingsystemmajrelease => '7',
      :path                      => '/root',
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('gradle') }
    it { should contain_file('/opt/gradle').with({
      'ensure' => 'link',
      'target' => '/opt/gradle-3.0',
      })}
  end

  context 'with version set to 2.14 and gradle opts set to -D -Dfile.encoding=UTF-8' do
    let(:params) do
      {
        :version => '2.14',
        :gradle_opts => '-Dfile.encoding=UTF-8',
      }
    end

    it { should contain_class('gradle').with({
      'version' => '2.14',
      'gradle_opts' => '-Dfile.encoding=UTF-8',
      }) }
  end
end
