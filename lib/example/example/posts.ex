defmodule Example.Posts do
  alias Example.Commands.CreatePost
  alias Example.Queries.GetPostById

  def get_post_by_id(id) do
    GetPostById.run(id)
  end

  def create_post(data) do
    CreatePost.execute(data)
  end
end
