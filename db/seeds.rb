city = City.create!(name: 'City', latitude: 0.0, longitude: 0.0)

image = File.open(Rails.root.join('test', 'fixtures', 'files', 'blank.jpg'))

sport_type = SportType.create!(name: 'Football', color: '#fff', icon: image)

user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79998887766'
)

user.update!(api_token: 'foobar')

event = Event.create!(
  name: 'Event', description: 'Description', address: 'Address',
  longitude: 0.0, latitude: 0.0, starts_at: 1.month.from_now, ends_at: '23:59',
  user_limit: 2, team_limit: 2, price: 1, sport_type: sport_type, creator: user
)

