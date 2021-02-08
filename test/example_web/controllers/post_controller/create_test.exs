defmodule ExampleWeb.PostController.CreateTest do
  use ExampleWeb.ConnCase

  alias Example.Posts

  test "POST /posts/", %{conn: conn} do
    post = %{
      "title" => "hello",
      "content" => "A long post about stuff"
    }

    response = conn |> post("/posts/", post) |> json_response(200)
    assert Map.keys(response) == ["content", "id", "inserted_at", "title", "updated_at"]

    assert Map.take(response, ["title", "content"]) == %{
             "content" => "A long post about stuff",
             "title" => "hello"
           }

    {:ok, post} = Posts.get_post_by_id(response["id"])
    assert post.id == response["id"]
  end
end
