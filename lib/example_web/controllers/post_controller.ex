defmodule ExampleWeb.PostController do
  use ExampleWeb, :controller

  alias Example.Posts

  def show(conn, _params = %{"id" => post_id}) do
    case Posts.get_post_by_id(post_id) do
      {:ok, post} -> json(conn, post)
      {:error, :post_not_found} -> conn |> put_status(404) |> json(:post_not_found)
    end
  end

  def create(conn, _params = %{"title" => title, "content" => content}) do
    {:ok, post} = Posts.create_post(%{title: title, content: content})
    json(conn, post)
  end
end
