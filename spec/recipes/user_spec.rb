# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::user' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:user) { 'ircd' }
  let(:group) { 'ircd' }
  let(:install_dir) { '/usr/local/ircd' }

  it 'creates its group' do
    expect(chef_run).to create_group(group)
  end

  it 'creates its user' do
    expect(chef_run).to create_user(user).with(
      gid: group,
      home: install_dir
    )
  end

end
