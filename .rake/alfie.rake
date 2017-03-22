
COMPOSE_FILE = "$HOME/alfieproject/docker-compose.yml"

namespace :alfie do

  task :containers do
    sh "docker-compose -f #{COMPOSE_FILE} up -d"
  end

  task :logs do
    sh "docker-compose -f #{COMPOSE_FILE} logs -f"
  end

  task :shell do
    sh "docker exec -it myalfie bash"
  end

  task :psql do
    sh "docker exec -it postgres sh -c 'su postgres -c psql'"
  end
    
end
