defmodule MenuCard.Menu.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field(:author_id, :integer)
    field(:comment, :string)

    belongs_to(:item, MenuCard.Menu.Item)

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:comment, :author_id])
    |> validate_required([:comment, :author_id])
  end
end
