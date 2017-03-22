namespace :docker do
  task :rm do
    sh "docker rm -f -v $(docker ps -aq)"
  end
end
