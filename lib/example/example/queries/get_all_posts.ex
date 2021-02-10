defmodule Example.Queries.GetAllPosts do
  alias Example.Schemas.Post
  alias Example.Repo

  import Ecto.Query

  def run() do
    query = from p in Post, order_by: p.id
    posts = Repo.all(query)
    {:ok, posts}
  end
end
