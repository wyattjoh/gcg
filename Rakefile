require "./lib/sig.rb"

task :sign do |t, args|
  ARGV.each { |a| task a.to_sym do ; end }

  puts create_signature(ARGV[1].to_s)
end
