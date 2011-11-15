
# Create some users

User.create({:full_name => "User Name 1", :email => "email1@example.com", :group => 'development'})
User.create({:full_name => "User Name 2", :email => "email2@example.com", :group => 'development'})
User.create({:full_name => "User Name 3", :email => "email3@example.com", :group => 'development'})
User.create({:full_name => "User Name 4", :email => "email4@example.com", :group => 'development'})
User.create({:full_name => "User Name 5", :email => "email5@example.com", :group => 'development'})
User.create({:full_name => "User Name 6", :email => "email6@example.com", :group => 'development'})

# Create some tickets

t1 = Ticket.create({
  :title => "This is broken", :description => "When I touch it, it breaks.",
  :status => "open", :severity => "serious", :owner_id => 1
})
t2 = Ticket.create({
  :title => "This is really broken", :description => "When I touch it, it explodes.",
  :status => "open", :severity => "serious", :owner_id => 2
})
t3 = Ticket.create({
  :title => "This is sort of broken", :description => "When I touch it, it leaks.",
  :status => "open", :severity => "minor", :owner_id => 3
})
t4 = Ticket.create({
  :title => "Client is angry", :description => "Their installation is completely borked.",
  :status => "open", :severity => "you make bunny cry", :owner_id => 4
})
t5 = Ticket.create({
  :title => "This is broken", :description => "When I touch it, it breaks.",
  :status => "closed", :severity => "serious", :owner_id => 5
})

# Add some comments

Comment.create({:ticket_id => 1, :full_name => "User Name 1", :body => "I dunno. Works for me."})
Comment.create({:ticket_id => 1, :full_name => "User Name 2", :body => "This is a problem."})
Comment.create({:ticket_id => 2, :full_name => "User Name 3", :body => "Not good."})
Comment.create({:ticket_id => 3, :full_name => "User Name 2", :body => "Please fix this."})

