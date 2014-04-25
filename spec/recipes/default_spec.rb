# Encoding: utf-8
require 'spec_helper'

describe 'ircd-hybrid::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include ircd-hybrid::source' do
    expect(chef_run).to include_recipe 'ircd-hybrid::source'
  end
end
