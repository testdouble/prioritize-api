defmodule PrioritizeApi.Topic do
  use PrioritizeApi.Web, :model

  schema "topics" do
    field :title, :string
    field :description, :string
    has_many :votes, PrioritizeApi.Vote

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
