defmodule ExampleWeb.PostController.DeleteTest do
  use ExampleWeb.ConnCase

  alias Example.Posts

  test "Delete /posts/:id", %{conn: conn} do
    {:ok, post} =
      Posts.create_post(%{
        "title" => "hello",
        "content" => "A long post about stuff"
      })

    conn |> delete("/posts/#{post.id}") |> json_response(200)
    conn |> get("/posts/#{post.id}") |> json_response(404)
  end

  test "post is missed" , %{conn: conn} do
    conn |> delete("/posts/1") |> json_response(404)
  end
end
