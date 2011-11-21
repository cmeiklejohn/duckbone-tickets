class User < ActiveRecord::Base

  has_many :tickets, :foreign_key => 'owner_id'

  validates_presence_of :full_name, :group

  def as_json(options={})
    super :only => [:id, :full_name, :email, :group]
  end

end
