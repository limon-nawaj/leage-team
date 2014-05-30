Club.create!([
	{name: "First club", contact_officer: "A Person", date_created: "2014-05-20"},
	{name: "Second club", contact_officer: "B Person", date_created: "2014-05-21"},
	{name: "Third club", contact_officer: "C Person", date_created: "2014-05-22"},
])



Team.create([
	{club_id: 1, name: "Team 1", captain: "JimBob", date_created: "2014-05-20"},
	{club_id: 2, name: "Team 2", captain: "Beyly", date_created: "2014-05-22"},
	{club_id: 2, name: "Team 3", captain: "Limon", date_created: "2014-05-21"},
	{club_id: 1, name: "Team 3", captain: "Jhon", date_created: "2014-05-23"},
])