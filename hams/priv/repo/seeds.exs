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

#per nat's notes: http://khoury.neu.edu/home/ntuck/courses/2019/01/cs4550/notes/14-multi-and-passwords/notes.html
pwhash1 = Argon2.hash_pwd_salt("cl3verPW1")
pwhash2 = Argon2.hash_pwd_salt("cl3verPW2")
pwhashGrader = Argon2.hash_pwd_salt("4Grader")
pwhashCater = Argon2.hash_pwd_salt("ezPass1")

Repo.insert!(%User{email: "wpggooley@gmail.com", password_hash: pwhash1, admin: true, fname: "Will", lname: "Gooley"})
Repo.insert!(%User{email: "notadmin@test.com", password_hash: pwhash2, admin: false, fname: "Test", lname: "User"})
Repo.insert!(%User{email: "grader@test.com", password_hash: pwhashGrader, admin: true, fname: "CS4550", lname: "Grader"})
Repo.insert!(%User{email: "hireme@ezcater.com", password_hash: pwhashCater, admin: true, fname: "Garubhebb", lname: "Forkatering"})

Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Admitted", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-07 12:00:00], type: "Prospective", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Admitted", guides_needed: 3})
Repo.insert!(%Tour{when: ~N[2019-04-17 14:00:00], type: "Prospective", guides_needed: 7})
Repo.insert!(%Tour{when: ~N[2019-05-18 14:00:00], type: "Prospective", guides_needed: 12})
Repo.insert!(%Tour{when: ~N[2019-05-18 14:00:00], type: "Admitted", guides_needed: 0})


Repo.insert!(%ScheduleTour{user_id: 1, tour_id: 1})
Repo.insert!(%ScheduleTour{user_id: 2, tour_id: 6})
