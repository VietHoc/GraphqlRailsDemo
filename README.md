# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

h1. http://localhost:3000/graphiql

Example query

```
query ItemList {
  items {
    id
    title
    description
  }
}

query ItemListSearch($query: String) {
  items(query: $query) {
    id
    title
    description
    artist {email}
  }
}

query ItemDetail($id: ID!) {
  item(id: $id) {
    id
    title
    description
  }
}
```