defmodule MenuCardWeb.Schema do
  use Absinthe.Schema

  @desc "An item"
  object :item do
    field(:id, :id)
    field(:name, :string)
    field(:price, :integer)

    field(:reviews, list_of(:review))
  end

  @desc "Review for an item"
  object :review do
    field(:id, :id)
    field(:comment, :string)
    field(:authur_id, :id)
  end

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn args, _ ->
        {:ok, MenuCard.Menu.get_item(args)}
      end)
    end
  end

  mutation do
    field :create_item, :item do
      arg(:name, non_null(:string))
      arg(:price, non_null(:integer))

      resolve(fn args, _ ->
        {:ok, MenuCard.Menu.create_item(args)}
      end)
    end

    field :do_review, :review do
      arg(:comment, non_null(:string))
      arg(:authur_id, non_null(:id))
      arg(:item_id, non_null(:id))

      resolve(fn args, _ ->
        {:ok, MenuCard.Menu.create_review(args)}
      end)
    end
  end
end
