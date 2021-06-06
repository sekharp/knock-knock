# Knock Knock: Canvassing by Empower

This repo contains a basic CRUD app for tracking prospects when canvassing door-to-door built on Ruby on Rails and React.

![Knock Knock App Demo](knock-knock-app-demo.gif)

Features include:

* Create, view, update and delete prospects
* Track prospects names and emails with notes about prospects
* Authentication via [devise](https://github.com/heartcombo/devise) including forgotten password and user signup
* Authorization so users only see their own prospects
* Validation on name, email and notes for length and format
* Minor styling via Bootstrap
* Debounce on edit requests for 1 second after users stop typing (to minimize API requests)
* Mobile-friendly views
* Test for modelling of users and prospects (including validation tests)

## Getting Started

Before running this app please install [Rails 6.x](https://guides.rubyonrails.org/getting_started.html) and [Ruby 3.x](https://www.ruby-lang.org/en/documentation/installation/). To run this app locally, run the following commands in your terminal:

```shell
git clone https://github.com/sekharp/knock-knock.git
cd knock-knock
rails db:create db:migrate db:seed
rails s
```

After starting the server visit `http://localhost:3000`.

## Questions, Suggestions, Comments?

Get in touch by adding an [issue](https://github.com/sekharp/knock-knock/issues).
