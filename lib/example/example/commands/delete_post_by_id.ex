defmodule Example.Commands.DeletePostById do
  alias Example.Repo

  def execute(post) do
    post
    |> Repo.delete()
  end
end
