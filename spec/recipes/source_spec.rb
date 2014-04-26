# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::source' do
  let(:install_dir) { '/usr/local/ircd' }
  let(:source_dir) { "#{install_dir}/src" }
  let(:user) { 'ircd' }
  let(:group) { 'ircd' }

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:chef_skip_run) do
    run = ChefSpec::Runner.new do |node|
      node.set[:ircd][:directory] = install_dir
    end

    # File.exist? is potentially called all over the place in
    # chef, we only want to stub our one argument
    original_exist = ::File.method(:exist?)
    ::File.stub(:exist?) do |arg|
      if arg == "#{install_dir}/bin/ircd"
        true
      else
        original_exist.call(arg)
      end
    end

    run.converge(described_recipe)
  end

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

  it 'should only fetch the source if ircd needs to be installed' do
    expect(chef_skip_run).not_to include_recipe('ircd-hybrid::subversion')
  end

  it 'should only build and install the if ircd needs to be installed' do
    expect(chef_skip_run).not_to include_recipe('ircd-hybrid::build')
  end
end
