defmodule Example.Posts do
  alias Example.Commands.CreatePost
  alias Example.Commands.DeletePostById
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

  def delete_post_by_id(id) do
    case GetPostById.run(id) do
      {:ok, post} -> DeletePostById.execute(post)
      {:error, :post_not_found} -> {:error, :post_not_found}
    end
  end
end
