u = User.create(name: :root, email: "admin@flights.com", admin: true)
Admin.create(userid: u.id, pwd: "123")
