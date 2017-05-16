# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Eeeapp.Repo.insert!(%Eeeapp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Eeeapp.Repo.insert!(%Eeeapp.Accounts.Player{display_name: "Helton Wernik", username: "HelWer", password: "password", score: 1000})
Eeeapp.Repo.insert!(%Eeeapp.Accounts.Player{display_name: "Evan Czaplicki", username: "evancz", password: "password", score: 1500})
