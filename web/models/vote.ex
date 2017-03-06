defmodule PrioritizeApi.Vote do
  use PrioritizeApi.Web, :model

  schema "votes" do
    belongs_to :user, PrioritizeApi.User
    belongs_to :topic, PrioritizeApi.Topic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :topic_id])
    |> foreign_key_constraint(:user)
    |> foreign_key_constraint(:topic)
    |> validate_required([])
  end
end
