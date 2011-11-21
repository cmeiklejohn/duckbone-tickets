class Comment < ActiveRecord::Base

  belongs_to :ticket

  validates_presence_of :body

  def as_json(options={})
    super :only => [:id, :full_name, :body, :created_at]
  end

end
