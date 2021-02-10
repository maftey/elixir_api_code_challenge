defmodule ExampleWeb.PostController.ShowTest do
  use ExampleWeb.ConnCase

  alias Example.Posts

  test "GET /posts/:id", %{conn: conn} do
    {:ok, post} =
      Posts.create_post(%{
        "title" => "hello",
        "content" => "A long post about stuff"
      })

    response = conn |> get("/posts/#{post.id}") |> json_response(200)
    assert Map.keys(response) == ["content", "id", "inserted_at", "title", "updated_at"]

    assert Map.take(response, ["title", "content"]) == %{
             "content" => "A long post about stuff",
             "title" => "hello"
           }
  end

  test "post is missed" , %{conn: conn} do
    conn |> get("/posts/1") |> json_response(404)
  end
end
