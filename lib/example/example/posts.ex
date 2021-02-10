defmodule Example.Posts do
  alias Example.Commands.CreatePost
  alias Example.Queries.GetPostById
  alias Example.Queries.GetAllPosts

  def get_post_by_id(id) do
    GetPostById.run(id)
  end

  def create_post(data) do
    CreatePost.execute(data)
  end

  def get_all_posts() do
    GetAllPosts.run()
  end
end
