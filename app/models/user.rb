class User < ActiveRecord::Base

  has_many :tickets, :foreign_key => 'owner_id'

  validates_presence_of :full_name, :group

  def default_json
    self.as_json :only => [:id, :full_name, :email, :group]
  end

end
