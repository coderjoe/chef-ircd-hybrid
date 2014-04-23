guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^(recipes/.+)\.rb$}) { |m| "spec/#{m[0]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard "foodcritic", :cookbook_paths => '.', :all_on_start => false do
  watch(%r{^attributes/.+\.rb$})
  watch(%r{^providers/.+\.rb$})
  watch(%r{^recipes/.+\.rb$})
  watch(%r{^resources/.+\.rb$})
	watch('metadata.rb')
end
