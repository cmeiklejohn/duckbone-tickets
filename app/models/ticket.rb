class Ticket < ActiveRecord::Base

  belongs_to :owner, :class_name => "User"
  has_many :comments

  validates_presence_of :severity, :status
  validates_length_of :title, :in => 4..100
  validates_uniqueness_of :title, :message => "is already taken by another ticket"

  def default_json
    self.as_json :only => [:id, :title, :description, :severity, :status, :created_at],
      :include => {
        :comments => {:only => [:id, :full_name, :body, :created_at]},
        :owner => {:only => [:id, :full_name, :email]}
      }
  end

end
