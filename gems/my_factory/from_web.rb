require 'factory_girl'
require 'rspec'
 
FactoryGirl.define  do

  factory :user do |f|
    #f.sequence(:user_name){ |n| "fooAPL#{n}" }
    f.password 'ups'
    f.email 'test@autoplenum.de'
  end

 
  factory :trademark do |f|
    f.sequence(:name) {|n| "TRADEMARK#{n}"}
  end
 
  factory :model do |f|
    f.name "The Model"
    f.association :trademark
    f.association :user
  end
 
  factory :car do |f|
    f.association :trademark
    f.association :model
    f.name "Carrr"
  end

end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# RSpec without Rails
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end


#c =  create(:car)

#b =  FactoryGirl.build(:car)

u = FactoryGirl.build(:user)
