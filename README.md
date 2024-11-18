# build
`docker compose build`

# create rails app (only first)
`docker compose run --rm api rails new .  -B -d postgresql --api`

## build again to run bundle install (only first)
`docker compose build` 

## setup database.yml(only first)

# setup database
`docker compose run --rm api rails db:create && docker compose run --rm api rails db:migrate && docker compose run --rm api rails db:seed`

# up
`docker compose up -d`
