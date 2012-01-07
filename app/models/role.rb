class Role < ActiveRecord::Base
  has_many :users

  validates_uniqueness_of :name

  [:admin, :user].each do |role|
    define_method("#{role}?") do
      self.name == role.to_s
    end
  end
end
