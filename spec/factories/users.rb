FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) {|n| "User #{n}"}
    f.sequence(:email) {|n| "#{n}@user.com"}
    f.role {|r| r.association(:role, name: "user")}
  end

  factory :admin, parent: :user  do |f|
    f.role {|r| r.association(:role, name: "admin")}
  end
end
