desc 'run specs'
task :spec do
  sh 'rspec -cf d --fail-fast'
end

desc 'run cukes'
task :cuke do
  sh 'cucumber -t ~@not-implemented'
end

desc 'run specs and cukes'
task default: [:spec, :cuke]