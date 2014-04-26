# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::build' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:chef_run_ssl) do
    ChefSpec::Runner.new do |node|
      node.set[:ircd][:source][:openssl] = true
    end.converge(described_recipe)
  end

  let(:user) { 'ircd' }
  let(:group) { 'ircd' }
  let(:install_dir) { '/usr/local/ircd' }
  let(:build_dir) { "#{install_dir}/src" }
  let(:configure_script) { "./configure --prefix=\"#{install_dir}\"" }

  it 'should include build-essential' do
    expect(chef_run).to include_recipe('build-essential')
  end

  it 'should configure' do
    expect(chef_run).to run_bash('configure')
      .with(cwd: build_dir, user: user, group: group, code: configure_script)
  end

  it 'should install libssl if openssl was requested' do
    expect(chef_run_ssl).to install_package('libssl-dev')
  end

  it 'should configure with ssl if requested' do
    expect(chef_run_ssl).to run_bash('configure').with(
      cwd: build_dir,
      user: user,
      group: group,
      code: "#{configure_script} --enable-openssl"
    )
  end

  it 'should build' do
    expect(chef_run).to run_bash('make').with(
      cwd: build_dir,
      user: user,
      group: group,
      code: 'make'
    )
  end

  it 'should create the install directory' do
    expect(chef_run).to create_directory(install_dir)
      .with(recursive: true, owner: user, group: group, mode: 0750)
  end

  it 'should install' do
    expect(chef_run).to run_bash('make install').with(
      cwd: build_dir,
      user: user,
      group: group,
      code: 'make install'
    )
  end
end
