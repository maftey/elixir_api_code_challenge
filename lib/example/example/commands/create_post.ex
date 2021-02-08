defmodule Example.Commands.CreatePost do
  alias Example.Schemas.Post
  alias Example.Repo

  def execute(data) do
    %Post{}
    |> Post.changeset(data)
    |> Repo.insert()
  end
end
