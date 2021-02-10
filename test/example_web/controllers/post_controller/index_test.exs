defmodule ExampleWeb.PostController.IndexTest do
  use ExampleWeb.ConnCase

  alias Example.Posts


  test "GET /", %{conn: conn} do
    posts = [
      %{
      "title" => "hello",
      "content" => "A long post about stuff"
      },
      %{
        "title" => "hello2",
        "content" => "A long post about stuff2"
      }
    ]

    Enum.each(posts, fn post ->
        Posts.create_post(%{
          "title" => post["title"],
          "content" => post["content"],
        })
      end
    )

    response = conn |> get("/posts") |> json_response(200)

    assert length(posts) == length(response)

    Enum.each(response, fn json_post ->
      assert Map.keys(json_post) == ["content", "id", "inserted_at", "title", "updated_at"]
    end)

    response_post = Enum.map(response, fn p ->
      %{"title"=>p["title"],
      "content" => p["content"]}
    end);

    assert response_post = posts

  end
end
