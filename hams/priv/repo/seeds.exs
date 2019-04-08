# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hams.Repo.insert!(%Hams.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hams.Repo
alias Hams.Users.User
alias Hams.Tours.Tour
alias Hams.Schedules.ScheduleTour

Repo.insert!(%User{email: "wpggooley@gmail.com", admin: true, fname: "Will", lname: "Gooley"})
Repo.insert!(%User{email: "notadmin@test.com", admin: false, fname: "Test", lname: "User"})

Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Admitted", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-07 12:00:00], type: "Prospective", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Admitted", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Prospective", guides_needed: 7})
Repo.insert!(%Tour{when: ~N[2019-05-18 14:00:00], type: "Prospective", guides_needed: 12})
Repo.insert!(%Tour{when: ~N[2019-05-18 14:00:00], type: "Admitted", guides_needed: 0})


Repo.insert!(%ScheduleTour{user_id: 1, tour_id: 1})
Repo.insert!(%ScheduleTour{user_id: 2, tour_id: 6})
