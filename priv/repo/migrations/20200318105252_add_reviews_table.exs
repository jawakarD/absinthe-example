defmodule MenuCard.Repo.Migrations.AddReviewsTable do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add(:comment, :text)
      add(:authur_id, :integer)
      add(:item_id, references(:items, on_delete: :nothing))

      timestamps()
    end
  end
end
