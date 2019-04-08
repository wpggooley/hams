# hams
Web Dev Project 2: Husky Ambassadors Management System


#Users
id: int (auto-generated)
email: string,
admin: boolean,

#Tours
id: int (auto-generated)
when: :naive_datetime (postgresql/ecto doesn't have great support for non-UTC times)
tour_type: string (enum: Admitted, Prospective; enum via dropdown b/c postgresql/ecto doesn't support enum)
guides_needed: int


#Tours_users
id: int (auto-generated)
tid: int (tour id, foreign key)
uid: int (user id, foreign key)


