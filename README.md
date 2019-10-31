# README

Test project with two api endpoints and rspec tests.

## Project deployment
```
$ git clone https://github.com/ayamschikov/api-endpoint.git
$ docker-compose up -d --build
```
You can access to project by `localhost`, make sure that 80 and 5432 ports aren't bind.

## Add test data
Enter the following command inside web container
```
$ rails data_migrations:development_data
```
