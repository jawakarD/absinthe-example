defmodule MenuCard.Review do
  use Ecto.Schema
  import Ecto.Changeset

  alias MenuCard.{Item, Review}

  schema "reviews" do
    field(:comment, :string)
    field(:authur_id, :integer)

    belongs_to(:item, Item)

    timestamps()
  end

  @doc false
  def changeset(%Review{} = review, attrs) do
    review
    |> cast(attrs, [:comment, :authur_id, :item_id])
    |> validate_required([:comment, :authur_id, :item_id])
  end
end
