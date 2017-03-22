task :today do
  sh 'touch $(date "+%Y-%m-%d.md")'
end
