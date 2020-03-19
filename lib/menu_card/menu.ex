defmodule MenuCard.Menu do
  import Ecto.Query
  alias MenuCard.{Item, Repo, Review}

  def create_item(attrs) do
    {:ok, item} =
      %Item{}
      |> Item.changeset(attrs)
      |> Repo.insert()

    item
  end

  def get_item(%{id: id}) do
    item = Repo.get(Item, id)
    Repo.preload(item, :reviews)
  end

  def create_review(attrs) do
    {ok, review} =
      %Review{}
      |> Review.changeset(attrs)
      |> Repo.insert()

    IO.inspect(review)

    review
  end

  def get_reviews_by_item(item_id) do
    query =
      from(r in Review,
        where: r.item_id == ^item_id
      )

    Repo.all(query)
  end
end
