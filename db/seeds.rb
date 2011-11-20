
# Ticket titles

def statements
  ["This is broken", "This is really broken", "This is sort of broken", "Client is angry",
  "I can't figure this out", "What is going on with this feature?", "Who knows why this doesn't work?",
  "Oh god you make ducky cry", "When I click it I get a 500 error", "File not found",
  "PC Load Letter?", "Is this a bug?", "I don't know how this happened"]
end

def rand_statement
  statements[ rand(statements.length) ]
end

def first_names
  ["Jim", "Bob", "Hank", "Will", "Jack", "Phillip", "Fred", "Chris",
  "Sally", "Jill", "Nancy", "Susan", "Ellen", "Diana", "Lisa", "Sarah"]
end

def last_names
  ["Jackson", "Roncka", "Burton", "White", "Smith", "Black", "Brown",
  "Santiago", "Trumbull", "Miller", "Carter", "Johnson", "Washington", "Maxwell"]
end

def rand_name
  first_names[ rand(first_names.length) ] + " " + last_names[ rand(last_names.length) ]
end

def rand_group
  ["development", "sales", "marketing", "qa", "support", "legal"][ rand(6) ]
end

def rand_severity
  ["minor", "serious", "ducky cry"][ rand(3) ]
end

def rand_status
  ['open', 'closed'][ rand(2) ]
end

def rand_kind
  ["feature", "bug", "chore"][ rand(3) ]
end

# Create some users

30.times do
  User.create({
    :full_name => rand_name, :group => rand_group
  })
end

# Create some tickets

100.times do
  t = Ticket.create!({
    :kind => rand_kind,
    :title => rand_statement,
    :description => rand_statement,
    :status => rand_status,
    :severity => rand_severity,
    :owner_id => rand(30)
  })
  rand(5).times do
    t.comments.create!({
      :full_name => rand_name,
      :body => rand_statement
    })
  end
end