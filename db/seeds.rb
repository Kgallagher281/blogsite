User.create([
{id: 1, first: 'Joan', last: 'borbon', email: 'jborbon@live.com', password: "test"},
{id: 2, first: 'Kevin', last: 'Gallagher', email: 'Kevin.gallagher23@gmail.com', password: "test"},
{id: 3, first: 'Boony', last: 'Guzman', email: 'josueguzman89@gmail.com', password: "test"},
{id: 4, first: 'Cam', last: 'Crews', email: 'CCrews@gmail.com', password: "test"}
])


Post.create([
{genre: "movie", created_at: Date.parse("2000-12-05"), user_id: 1, url: "https://www.youtube.com/watch?v=wvXyhJfLZjU"},
{genre: "movie", created_at: Date.parse("2000-11-05"), user_id: 2, url: "https://www.youtube.com/watch?v=FJwdp7ueIxc"},
{genre: "movie", created_at: Date.parse("2000-10-05"), user_id: 3, url: "https://www.youtube.com/watch?v=9O_3aFMahRg"},
{genre: "movie", created_at: Date.parse("2000-09-05"), user_id: 4, url: "https://www.youtube.com/watch?v=iloct9dnMxk"}
])

Reviews.create([
{id: 1, body: "this is the worst", created_at: Date.parse("2000-12-05"), user_id: 1, rating: 1},
{id: 2, body: "this is my favorite movie", created_at: Date.parse("2000-11-05"), user_id: 2, rating: 5},
{id: 3, body: "So bad it is actually good", created_at: Date.parse("2000-10-05"), user_id: 3, rating: 4},
{id: 4, body: "Eh not the worst but, not the best", created_at: Date.parse("2000-09-05"), user_id: 4, rating: 0}
])


Profile.create([
{id: 1, group:"Web Desiger", position: "captain", birth: Date.parse("1988-10-05"), about_me: "I am the best", user_id: 1},
{id: 2,  group:"Web Desiger", position: "major", birth: Date.parse("1986-09-25"), about_me: "I doing great", user_id: 2},
{id: 3,  group:"Web Desiger", position: "private", birth: Date.parse("1989-11-21"), about_me: "I could use some help", user_id: 3},
{id: 4,  group:"Web Instrcutor", position: "general", birth: Date.parse("1983-12-25"), about_me: "I am the best", user_id: 4}

])

