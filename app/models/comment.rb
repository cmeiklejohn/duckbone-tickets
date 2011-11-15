class Comment < ActiveRecord::Base

  belongs_to :ticket

  validates_presence_of :body

  def default_json
    self.as_json :only => [:id, :full_name, :body, :created_at]
  end

end
