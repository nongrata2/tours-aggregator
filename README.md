# README

1. To install all the required libraries:

```
bundle install
```

2. To setup the DB

```
rails db:migrate
```

3. To run all the rake tasks(to fill the DB):

```
rake data:fetch_cities
rake data:fetch_tags
rake data:fetch_tours
rake data:fetch_categorizations
rake data:fetch_recommendations
```

4. To run the web server
```
rails s
```
