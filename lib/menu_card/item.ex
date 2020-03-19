defmodule MenuCard.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias MenuCard.{Review, Item}

  schema "items" do
    field(:name, :string)
    field(:price, :integer)

    has_many(:reviews, Review)

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
    |> unique_constraint(:name)
  end
end
