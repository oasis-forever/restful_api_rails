## Environment

* WSL2(Ubuntu 20.04.1 LTS)
* Rails 6.0.3.2
* ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]

## 2. Reference

1. [Build a RESTful JSON API With Rails 5 - Part 1](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)
2. [Build a RESTful JSON API With Rails 5 - Part 2](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two)
3. [Build a RESTful JSON API With Rails 5 - Part 3](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-three)

## 3. Routing

```bash
                               Prefix Verb   URI Pattern                                                                              Controller#Action
                                todos GET    /todos(.:format)                                                                         v2/todos#index
                           todo_items GET    /todos/:todo_id/items(.:format)                                                          v1/items#index
                                      POST   /todos/:todo_id/items(.:format)                                                          v1/items#create
                            todo_item GET    /todos/:todo_id/items/:id(.:format)                                                      v1/items#show
                                      PATCH  /todos/:todo_id/items/:id(.:format)                                                      v1/items#update
                                      PUT    /todos/:todo_id/items/:id(.:format)                                                      v1/items#update
                                      DELETE /todos/:todo_id/items/:id(.:format)                                                      v1/items#destroy
                                      GET    /todos(.:format)                                                                         v1/todos#index
                                      POST   /todos(.:format)                                                                         v1/todos#create
                                 todo GET    /todos/:id(.:format)                                                                     v1/todos#show
                                      PATCH  /todos/:id(.:format)                                                                     v1/todos#update
                                      PUT    /todos/:id(.:format)                                                                     v1/todos#update
                                      DELETE /todos/:id(.:format)                                                                     v1/todos#destroy
                           auth_login POST   /auth/login(.:format)                                                                    authentication#authenticate
                               signup POST   /signup(.:format)                                                                        users#create
        rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
           rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
        rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
  rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
        rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
         rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
       rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
                                      POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
        rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
                                      PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
                   rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
            rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
                   rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
            update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
                 rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
```

## 4. How to execute in local development environment

\* Install `httpie` package in advance for convenience refering to [jakubroztocil/httpie](https://github.com/jakubroztocil/httpie)

### 4-1. User

* create

```bash
$ http post :3000/signup name=sample_user email=sample@example.com password=hogehogefoobar
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"630efc9acb34143cd903d148fa0a5039"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 1998fefd-025f-4b7d-8350-f10fc90813ec
X-Runtime: 1.121861
X-XSS-Protection: 1; mode=block

{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ",
    "message": "Account created successfully"
}
```

### 4-2 Todo

* create

```bash
$ http post :3000/todos title=sample_todo_1 user_id=1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"9869b75dbe5b3ce06189d5df82297f8d"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: d7beffe0-c619-4604-9ad0-5e5f6204ede4
X-Runtime: 0.287665
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:10:29.148Z",
    "user_id": "1",
    "id": 1,
    "items": [],
    "title": "sample_todo_1",
    "updated_at": "2020-06-26T03:10:29.148Z"
}
```

* index

```bash
$ http :3000/todos Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f0af191e340b4bec1716d7580c6dc8c0"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 60712237-60b3-4662-98b9-0d8a78a2530c
X-Runtime: 0.069824
X-XSS-Protection: 1; mode=block

[
    {
        "created_at": "2020-06-26T03:10:29.148Z",
        "user_id": "1",
        "id": 1,
        "items": [],
        "title": "sample_todo_1",
        "updated_at": "2020-06-26T03:10:29.148Z"
    }
]
```

* show

```bash
$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"37f8d632b296d26588aec3dc9c4801ba"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 24f06764-e9bb-41f7-9122-789f735670de
X-Runtime: 0.070342
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:10:29.148Z",
    "user_id": "1",
    "id": 1,
    "items": [
        {
            "created_at": "2020-06-26T03:13:58.216Z",
            "done": null,
            "id": 1,
            "name": "sample_item_1",
            "todo_id": 1,
            "updated_at": "2020-06-26T03:13:58.216Z"
        }
    ],
    "title": "sample_todo_1",
    "updated_at": "2020-06-26T03:10:29.148Z"
}
```

* update

```bash
$ http put :3000/todos/1 title=test_todo_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: c14bbaac-3016-40e9-b266-81de2b90e453
X-Runtime: 0.088207
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"abba75d4191aedada5cbf9ef2ffe8e91"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: e0ca8851-8114-4d05-8327-0df8aade3364
X-Runtime: 0.074457
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:10:29.148Z",
    "user_id": "1",
    "id": 1,
    "items": [
        {
            "created_at": "2020-06-26T03:13:58.216Z",
            "done": null,
            "id": 1,
            "name": "sample_item_1",
            "todo_id": 1,
            "updated_at": "2020-06-26T03:13:58.216Z"
        }
    ],
    "title": "test_todo_1",
    "updated_at": "2020-06-26T03:18:14.203Z"
}
```

* dalete(`dependent: :destroy` により、先に todo を削除すると紐づいた items も共に削除される)

```bash
$ http delete :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 75e5ee10-945e-4bc0-ada4-f8d00f1c05f6
X-Runtime: 0.140235
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 404 Not Found
Cache-Control: no-cache
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 289663bb-bf0e-4155-94b4-4d1fd6c688b0
X-Runtime: 0.039833
X-XSS-Protection: 1; mode=block

{
    "message": "Couldn't find Todo with 'id'=1"
}
```

## 4-3. Items

* create

```bash
$ http post :3000/todos/1/items name=sample_item_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 201 Created
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"37f8d632b296d26588aec3dc9c4801ba"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0bad78ba-2e2d-422e-8468-7265fd0bef9f
X-Runtime: 0.414634
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:10:29.148Z",
    "user_id": "1",
    "id": 1,
    "items": [
        {
            "created_at": "2020-06-26T03:13:58.216Z",
            "done": null,
            "id": 1,
            "name": "sample_item_1",
            "todo_id": 1,
            "updated_at": "2020-06-26T03:13:58.216Z"
        }
    ],
    "title": "sample_todo_1",
    "updated_at": "2020-06-26T03:10:29.148Z"
}
```

* index

```bash
$ http :3000/todos/1/items Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f256c2cdbf7daa0a39f7c9a600788edf"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 29e6b233-1fcc-40e9-98c8-55b97a4a0b5f
X-Runtime: 0.019615
X-XSS-Protection: 1; mode=block

[
    {
        "created_at": "2020-06-26T03:13:58.216Z",
        "done": null,
        "id": 1,
        "name": "sample_item_1",
        "todo_id": 1,
        "updated_at": "2020-06-26T03:13:58.216Z"
    }
]
```

* show

```bash
$ http :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"4d49b8baeaded70ff3158152e1a7a6f4"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: b9439d4e-3bfc-4ed7-a069-1606f56222a6
X-Runtime: 0.048342
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:13:58.216Z",
    "done": null,
    "id": 1,
    "name": "sample_item_1",
    "todo_id": 1,
    "updated_at": "2020-06-26T03:13:58.216Z"
}
```

* update

```bash
$ http put :3000/todos/1/items/1 name=test_items_1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 3caa7398-f876-4e30-a8d9-b0f9a7b559cb
X-Runtime: 0.155419
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"f64558ac844a9dfb21ab3c302a199817"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: b948ccd7-2114-48c4-a49f-bffd954cc0cc
X-Runtime: 0.062878
X-XSS-Protection: 1; mode=block

{
    "created_at": "2020-06-26T03:13:58.216Z",
    "done": null,
    "id": 1,
    "name": "test_items_1",
    "todo_id": 1,
    "updated_at": "2020-06-26T03:29:56.976Z"
}
```

* dalete

```bash
$ http delete :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 204 No Content
Cache-Control: no-cache
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: cd06b95d-e078-49de-8c71-48195939a825
X-Runtime: 0.119596
X-XSS-Protection: 1; mode=block

$ http :3000/todos/1/items/1 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMzM1MjV9.tMsleFi7VRsAegsNKmCH-vCXPAVq95Y7hpnvEDZl8KQ'
HTTP/1.1 404 Not Found
Cache-Control: no-cache
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0aca5165-0c92-404d-a3f8-0c5d7561c4a5
X-Runtime: 0.035489
X-XSS-Protection: 1; mode=block

{
    "message": "Couldn't find Item with [WHERE `items`.`todo_id` = ? AND `items`.`id` = ?]"
}
```

## 4-4. Pagination

* Reset DB and creates sample data

```bash
$ rails db:migrate:reset
$ rails db:seed
```

* e.g.) Index todos

```bash
$ http :3000/todos page==3 Accept:'application/vnd.todos.v1+json' Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTMyMjk1OTN9.WI7mA_jvc8o61OTmDob6LgTx02Nh5680ukUInqbCY1Q'
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"b1996fe5dddf02aaa79e6924899bfb73"
Referrer-Policy: strict-origin-when-cross-origin
Transfer-Encoding: chunked
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: 0b8d0627-d627-4433-87c4-e7e27f1b2328
X-Runtime: 0.582031
X-XSS-Protection: 1; mode=block

[
    {
        "created_at": "2020-06-26T04:52:24.559Z",
        "id": 41,
        "items": [
            {
                "created_at": "2020-06-26T04:52:24.591Z",
                "done": false,
                "id": 41,
                "name": "harum",
                "todo_id": 41,
                "updated_at": "2020-06-26T04:52:24.591Z"
            }
        ],
        "title": "repellendus",
        "updated_at": "2020-06-26T04:52:24.559Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:24.636Z",
        "id": 42,
        "items": [
            {
                "created_at": "2020-06-26T04:52:24.669Z",
                "done": false,
                "id": 42,
                "name": "sit",
                "todo_id": 42,
                "updated_at": "2020-06-26T04:52:24.669Z"
            }
        ],
        "title": "praesentium",
        "updated_at": "2020-06-26T04:52:24.636Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:24.702Z",
        "id": 43,
        "items": [
            {
                "created_at": "2020-06-26T04:52:24.736Z",
                "done": false,
                "id": 43,
                "name": "accusamus",
                "todo_id": 43,
                "updated_at": "2020-06-26T04:52:24.736Z"
            }
        ],
        "title": "et",
        "updated_at": "2020-06-26T04:52:24.702Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:24.836Z",
        "id": 44,
        "items": [
            {
                "created_at": "2020-06-26T04:52:24.905Z",
                "done": false,
                "id": 44,
                "name": "vel",
                "todo_id": 44,
                "updated_at": "2020-06-26T04:52:24.905Z"
            }
        ],
        "title": "molestiae",
        "updated_at": "2020-06-26T04:52:24.836Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:24.946Z",
        "id": 45,
        "items": [
            {
                "created_at": "2020-06-26T04:52:24.979Z",
                "done": false,
                "id": 45,
                "name": "necessitatibus",
                "todo_id": 45,
                "updated_at": "2020-06-26T04:52:24.979Z"
            }
        ],
        "title": "perspiciatis",
        "updated_at": "2020-06-26T04:52:24.946Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.012Z",
        "id": 46,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.046Z",
                "done": false,
                "id": 46,
                "name": "numquam",
                "todo_id": 46,
                "updated_at": "2020-06-26T04:52:25.046Z"
            }
        ],
        "title": "velit",
        "updated_at": "2020-06-26T04:52:25.012Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.079Z",
        "id": 47,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.113Z",
                "done": false,
                "id": 47,
                "name": "impedit",
                "todo_id": 47,
                "updated_at": "2020-06-26T04:52:25.113Z"
            }
        ],
        "title": "quas",
        "updated_at": "2020-06-26T04:52:25.079Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.146Z",
        "id": 48,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.179Z",
                "done": false,
                "id": 48,
                "name": "sint",
                "todo_id": 48,
                "updated_at": "2020-06-26T04:52:25.179Z"
            }
        ],
        "title": "quia",
        "updated_at": "2020-06-26T04:52:25.146Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.215Z",
        "id": 49,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.258Z",
                "done": false,
                "id": 49,
                "name": "totam",
                "todo_id": 49,
                "updated_at": "2020-06-26T04:52:25.258Z"
            }
        ],
        "title": "quam",
        "updated_at": "2020-06-26T04:52:25.215Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.291Z",
        "id": 50,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.324Z",
                "done": false,
                "id": 50,
                "name": "odio",
                "todo_id": 50,
                "updated_at": "2020-06-26T04:52:25.324Z"
            }
        ],
        "title": "ea",
        "updated_at": "2020-06-26T04:52:25.291Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.357Z",
        "id": 51,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.391Z",
                "done": false,
                "id": 51,
                "name": "vero",
                "todo_id": 51,
                "updated_at": "2020-06-26T04:52:25.391Z"
            }
        ],
        "title": "dolores",
        "updated_at": "2020-06-26T04:52:25.357Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.424Z",
        "id": 52,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.457Z",
                "done": false,
                "id": 52,
                "name": "ipsam",
                "todo_id": 52,
                "updated_at": "2020-06-26T04:52:25.457Z"
            }
        ],
        "title": "voluptatem",
        "updated_at": "2020-06-26T04:52:25.424Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.491Z",
        "id": 53,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.525Z",
                "done": false,
                "id": 53,
                "name": "atque",
                "todo_id": 53,
                "updated_at": "2020-06-26T04:52:25.525Z"
            }
        ],
        "title": "iusto",
        "updated_at": "2020-06-26T04:52:25.491Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.557Z",
        "id": 54,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.591Z",
                "done": false,
                "id": 54,
                "name": "qui",
                "todo_id": 54,
                "updated_at": "2020-06-26T04:52:25.591Z"
            }
        ],
        "title": "quia",
        "updated_at": "2020-06-26T04:52:25.557Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.624Z",
        "id": 55,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.658Z",
                "done": false,
                "id": 55,
                "name": "ducimus",
                "todo_id": 55,
                "updated_at": "2020-06-26T04:52:25.658Z"
            }
        ],
        "title": "est",
        "updated_at": "2020-06-26T04:52:25.624Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.697Z",
        "id": 56,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.735Z",
                "done": false,
                "id": 56,
                "name": "at",
                "todo_id": 56,
                "updated_at": "2020-06-26T04:52:25.735Z"
            }
        ],
        "title": "omnis",
        "updated_at": "2020-06-26T04:52:25.697Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.801Z",
        "id": 57,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.869Z",
                "done": false,
                "id": 57,
                "name": "aut",
                "todo_id": 57,
                "updated_at": "2020-06-26T04:52:25.869Z"
            }
        ],
        "title": "temporibus",
        "updated_at": "2020-06-26T04:52:25.801Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.913Z",
        "id": 58,
        "items": [
            {
                "created_at": "2020-06-26T04:52:25.947Z",
                "done": false,
                "id": 58,
                "name": "placeat",
                "todo_id": 58,
                "updated_at": "2020-06-26T04:52:25.947Z"
            }
        ],
        "title": "aperiam",
        "updated_at": "2020-06-26T04:52:25.913Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:25.993Z",
        "id": 59,
        "items": [
            {
                "created_at": "2020-06-26T04:52:26.061Z",
                "done": false,
                "id": 59,
                "name": "modi",
                "todo_id": 59,
                "updated_at": "2020-06-26T04:52:26.061Z"
            }
        ],
        "title": "ut",
        "updated_at": "2020-06-26T04:52:25.993Z",
        "user_id": 1
    },
    {
        "created_at": "2020-06-26T04:52:26.111Z",
        "id": 60,
        "items": [
            {
                "created_at": "2020-06-26T04:52:26.179Z",
                "done": false,
                "id": 60,
                "name": "iure",
                "todo_id": 60,
                "updated_at": "2020-06-26T04:52:26.179Z"
            }
        ],
        "title": "inventore",
        "updated_at": "2020-06-26T04:52:26.111Z",
        "user_id": 1
    }
]
```
