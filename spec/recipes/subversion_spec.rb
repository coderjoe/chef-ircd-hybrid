require 'spec_helper'

describe 'ircd-hybrid::subversion' do
	let(:svn_uri) { "svn://some.fake.com/repo/uri/here" }
	let(:user) { "ircd" }
	let(:group) { "ircd" }
	let(:source_dir) { "/usr/local/ircd/src" }
	let(:chef_run) do 
		ChefSpec::Runner.new do |node|
			node.set[:ircd][:repository][:uri] = svn_uri
		end.converge( described_recipe ) 
	end

	it "should checkout the source code" do
		expect(chef_run).to sync_subversion( "ircd-hybrid" )
			.with( repository: svn_uri, destination: source_dir, user: user, group: group )
	end
end
