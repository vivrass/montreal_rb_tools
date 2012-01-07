class Talk < ActiveRecord::Base
  belongs_to :speaker, :class_name => "User"
  belongs_to :created_by, :class_name => "User"
  belongs_to :updated_by, :class_name => "User"

  validates_presence_of :title, :description, :speaker, :created_by, :updated_by
end
