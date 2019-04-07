# hams
Web Dev Project 2: Husky Ambassadors Management System


#Users
id: int (auto-generated)
email: string,
admin: boolean,

#Tours
id: int (auto-generated)
when: Datetime
type: string (enum: Admitted, Prospective)
guides_needed: int


#Tours_users
id: int (auto-generated)
tid: int (tour id, foreign key)
uid: int (user id, foreign key)


