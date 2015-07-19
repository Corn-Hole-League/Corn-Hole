League.create!([{ name: "Charleston Cornhole" },{ name: "Kiawah Cornhole" }])
local_league = League.create!(name: "league with events")
local_league.events.create!([
  { name: "Cornhole: TDM",
    location: "The Bar",
    occurs_on: '2015-07-16',
    starts_at: '15:31:12' },
  { name: "Cornhole: FFA",
    location: "The Better Bar",
    occurs_on: '2015-07-31',
    starts_at: '15:14:15' }
])
local_league.events.create!(name: "A third even",
    location: "The Not-so-Cool Bar",
    occurs_on: '2015-07-16',
    starts_at: 'never' )
local_league.teams.create!([
  { name: "Team 1",
    logo: "some cool logo",
    ranking: 25,
    location: "here, there, everywhere" },
  { name: "Team 2",
    logo: "some cool logo",
    ranking: 25,
    location: "here, there, everywhere" }
])
