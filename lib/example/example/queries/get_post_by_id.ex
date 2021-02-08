defmodule Example.Queries.GetPostById do
  alias Example.Schemas.Post
  alias Example.Repo

  def run(id) do
    post = Repo.get_by(Post, id: id)

    case post do
      nil -> {:error, :post_not_found}
      _ -> {:ok, post}
    end
  end
end
