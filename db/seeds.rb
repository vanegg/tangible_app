User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

album = Album.new(title: "My weekend")
User.find(1).albums << album
album.save

3.times do |n|
  page = Page.new(layout: 1, page_num: n + 1)
  album.pages << page

  5.times do |n|
    url = 'http://url.com/'
    url = url + ('a'..'z').to_a.shuffle[0,8].join
    photo = Photo.new(photo: url)
    location = Location.create(photo_id: photo.id, page_id: page.id, page_place: 1)

    User.find(1).photos << photo
    photo.locations << location
    photo.save
  end

  page.save
end