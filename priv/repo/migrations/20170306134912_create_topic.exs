defmodule PrioritizeApi.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
      add :description, :text

      timestamps()
    end
  end
end
