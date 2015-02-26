[![Build status][ci-image]][ci-url] 
[![Code Climate][cc-climate-image]][cc-climate-url] 
[![Test Coverage][cc-cov-image]][cc-cov-url]

# JW API

Install:


      $ git clone git@github.com:fishermanswharff/JWApi.git
      $ cd directory/you/just/created
      $ rake db:create db:migrate db:seed
      $ rails s


Endpoints:

              Prefix Verb   URI Pattern                                   Controller#Action
               users GET    /users(.:format)                              users#index
                     POST   /users(.:format)                              users#create
                user GET    /users/:id(.:format)                          users#show
                     PATCH  /users/:id(.:format)                          users#update
                     PUT    /users/:id(.:format)                          users#update
                     DELETE /users/:id(.:format)                          users#destroy
          categories GET    /categories(.:format)                         categories#index
                     POST   /categories(.:format)                         categories#create
            category GET    /categories/:id(.:format)                     categories#show
                     PATCH  /categories/:id(.:format)                     categories#update
                     PUT    /categories/:id(.:format)                     categories#update
                     DELETE /categories/:id(.:format)                     categories#destroy
              images GET    /images(.:format)                             images#index
       post_category PATCH  /posts/:post_id/categories/:id(.:format)      categories#update
                     PUT    /posts/:post_id/categories/:id(.:format)      categories#update
                     DELETE /posts/:post_id/categories/:id(.:format)      categories#destroy
         post_images POST   /posts/:post_id/images(.:format)              images#create
          post_image DELETE /posts/:post_id/images/:id(.:format)          images#destroy
     post_thumbnails POST   /posts/:post_id/thumbnails(.:format)          thumbnails#create
      post_thumbnail PATCH  /posts/:post_id/thumbnails/:id(.:format)      thumbnails#update
                     PUT    /posts/:post_id/thumbnails/:id(.:format)      thumbnails#update
                     DELETE /posts/:post_id/thumbnails/:id(.:format)      thumbnails#destroy
post_featured_images POST   /posts/:post_id/featured_images(.:format)     featured_images#create
 post_featured_image PATCH  /posts/:post_id/featured_images/:id(.:format) featured_images#update
                     PUT    /posts/:post_id/featured_images/:id(.:format) featured_images#update
                     DELETE /posts/:post_id/featured_images/:id(.:format) featured_images#destroy
               posts GET    /posts(.:format)                              posts#index
                     POST   /posts(.:format)                              posts#create
                post GET    /posts/:id(.:format)                          posts#show
                     PATCH  /posts/:id(.:format)                          posts#update
                     PUT    /posts/:id(.:format)                          posts#update
                     DELETE /posts/:id(.:format)                          posts#destroy
               login POST   /login(.:format)                              users#login
              logout GET    /logout(.:format)                             users#logout
     amazon_sign_key GET    /amazon/sign_key(.:format)                    amazon#sign_key
         email_admin POST   /email/admin(.:format)                        contact_form#route_admin
                     GET    /                                             redirect(301, https://github.com/fishermanswharff/JWApi)



[ci-image]: https://travis-ci.org/fishermanswharff/JWApi.svg?branch=master
[ci-url]: https://travis-ci.org/fishermanswharff/JWApi

[cc-climate-image]: https://codeclimate.com/github/fishermanswharff/JWApi/badges/gpa.svg
[cc-climate-url]: https://codeclimate.com/github/fishermanswharff/JWApi

[cc-cov-image]: https://codeclimate.com/github/fishermanswharff/JWApi/badges/coverage.svg
[cc-cov-url]: https://codeclimate.com/github/fishermanswharff/JWApi