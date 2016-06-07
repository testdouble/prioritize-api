ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PrioritizeApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PrioritizeApi.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PrioritizeApi.Repo)

