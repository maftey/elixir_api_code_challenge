# Example
 
## Setup

  * Install dependencies with `mix deps.get`
  * Start db with `docker-compose up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Run tests with `mix test`

## TODO

1. Add test case in `test/example_web/controllers/post_controller/show_test.exs` where there is no post to be found.  The json_response should be 404 (you will have to update the controller to make this so)
2. Add test case in `test/example_web/controllers/post_controller/create_test.exs` where the parameters are invalid.  The json_response should be 400 (you will have to update the controller to make this so)
3. Add a route (:index method in `lib/example_web/router.ex`) / controller handler (index function in `lib/example_web/controllers/post_controller.ex`) / query (get_all_posts in `lib/example/example/queries`) for listing all the posts.  Also add a test for this in `test/example_web/controllers/post_controller`
4. Add a route (:delete method in `lib/example_web/router.ex`) / controller handler (delete function in `lib/example_web/controllers/post_controller.ex`) / command (delete_post_by_id in `lib/example/example/commands`) for deleting a post.  Also add tests for this in `test/example_web/controllers/post_controller`.  Make sure to also test a case where the post is not found, json_response should be 404


