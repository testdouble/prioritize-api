defmodule PrioritizeApi.UserTest do
  use PrioritizeApi.ModelCase

  alias PrioritizeApi.User

  @valid_attrs %{
    crypted_password: "some content",
    email: "some content",
    name: "some name"
  }

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
