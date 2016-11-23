require 'dry-validation'

EMAIL_REGEX = 'nisse@hult.se'

UserSchema = Dry::Validation.Schema do
  required(:name).filled
  required(:email).filled(format?: EMAIL_REGEX)
  required(:age).maybe(:int?)

  required(:address).schema do
    required(:street).filled
    required(:city).filled
#    required(:zipcode).filled
  end

end

UserSchema.(
  name: 'Jane',
  email: 'jane@doe.org',
  address: { street: 'Street 1', city: 'NYC', zipcode: '1234' }
).inspect
