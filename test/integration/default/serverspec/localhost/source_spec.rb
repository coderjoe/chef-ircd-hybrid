# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::source' do
  let(:user) { 'ircd' }
  let(:group) { 'ircd' }

  describe group('ircd') do
    it { should exist }
  end

  describe user('ircd') do
    it { should exist }
    it { should belong_to_group group }
    it { should have_home_directory '/usr/local/ircd' }
    it { should have_login_shell '/bin/false' }
  end

  ['/usr/local/ircd', '/usr/local/ircd/src'].each do |dir|
    describe file(dir) do
      it { should be_directory }
      it { should be_owned_by user }
      it { should be_grouped_into group }
      it { should be_mode 750 }
    end
  end

  %w(bin etc lib share var).each do |dir|
    describe file("/usr/local/ircd/#{dir}") do
      it { should be_directory }
      it { should be_owned_by user }
      it { should be_grouped_into group }
      it { should be_mode 755 }
    end
  end

  ['/usr/local/ircd/bin/ircd', '/usr/local/ircd/bin/mkpasswd'].each do |f|
    describe file(f) do
      it { should be_file }
      it { should be_owned_by user }
      it { should be_grouped_into group }
      it { should be_mode 755 }
    end
  end

  describe file('/usr/local/ircd/etc/reference.conf') do
    it { should be_file }
    it { should be_owned_by user }
    it { should be_grouped_into group }

    it { should be_mode 644 }
  end

end
