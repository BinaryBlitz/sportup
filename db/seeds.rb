user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79998887766'
)

user.update!(api_token: 'foobar')
