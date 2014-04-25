# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::source' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:source_dir) { '/usr/local/ircd/src' }
  let(:user) { 'ircd' }
  let(:group) { 'ircd' }

  it 'should include ircd-hybrid::user' do
    expect(chef_run).to include_recipe('ircd-hybrid::user')
  end

  it 'should create a source directory' do
    expect(chef_run).to create_directory(source_dir)
      .with(owner: user, group: group, mode: 0750, recursive: true)
  end

  it 'should include ircd-hybrid::subversion' do
    expect(chef_run).to include_recipe('ircd-hybrid::subversion')
  end

  it 'should include ircd-hybrid::build' do
    expect(chef_run).to include_recipe('ircd-hybrid::build')
  end
end
