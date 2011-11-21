class Ticket < ActiveRecord::Base

  belongs_to :owner, :class_name => "User"
  has_many :comments

  validates_presence_of :severity, :status
  validates_length_of :title, :in => 4..100

  paginates_per 15

  def as_json (options={})
    super :only => [:id, :kind, :title, :description, :severity, :status, :owner_id, :created_at],
      :include => {
        :comments => {:only => [:id, :full_name, :body, :created_at]},
        :owner => {:only => [:id, :full_name, :email]}
      }
  end

end
