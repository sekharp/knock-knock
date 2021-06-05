# Knock Knock: Canvassing by Empower

This repo contains a basic CRUD app for tracking prospects when canvassing door-to-door built on Ruby on Rails and React. You can find the app [deployed to production on Heroku](https://knock-knock.herokuapp.com).

Features include:

* Create, view, update and delete prospects
* Track prospects names and emails with notes about prospects
* Authentication via [devise](https://github.com/heartcombo/devise)
* Validation on name, email and notes for length and format
* Minor styling via Bootstrap
* Debounce on edit requests for 1 second after users stop typing (to minimize API requests)
* Mobile-friendly views
* Deployed on production via Heroku

## Getting Started

To run this app locally, run the following commands in your terminal:

```shell
git clone https://github.com/heroku/knock-knock.git
cd knock-knock
rails db:create db:migrate db:seed
rails s
```

## Questions, Suggestions, Comments?

Get in touch by adding an [issue](https://github.com/sekharp/knock-knock/issues).
