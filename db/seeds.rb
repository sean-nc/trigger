User.create(
  email: "sean@email.com",
  password: "password"
)

200.times do |n|
  time = rand(0..100).hours.ago
  Profile.create(
      email: "email#{n} ",
      title: "This is the title for email#{n}",
      created_at: time
  )

  20.times do |x|
    time = rand(0..100).hours.ago
    Profile.create(
      email: "email#{n}#{x}",
      title: "This is the title for email#{n}",
      created_at: time
    )
  end
end

200.times do |n|
  sample_term = "#{n} search term #{SecureRandom.hex(10)}"
  time = rand(0..100).hours.ago
  term = SearchTerm.create(
    query: sample_term,
    created_at: time
  )
end

1000.times do |n|
  sample_term = "#{n} search term #{SecureRandom.hex(10)}"
  time = rand(50..100).hours.ago
  time2 = rand(0..50).hours.ago
  if n.even?
    active = true
    time3 = time2
  else
    active = false
    time3 = time
  end
  term = SearchTerm.create(
    query: sample_term,
    created_at: time,
    searched: active,
    updated_at: time3
  )
  term.create_bookmark(
    url: "#{sample_term} #{SecureRandom.hex(3)}",
    page_number: rand(0..30),
    created_at: time2
  )
end

1000.times do |n|
  sample_term = "#{n} search term #{SecureRandom.hex(10)}"
  time = rand(10..100).hours.ago
  time2 = rand(0..10).hours.ago
  if n.even?
    active = true
    time3 = time2
  else
    active = false
    time3 = time
  end
  term = SearchTerm.create(
    query: sample_term,
    created_at: time,
    searched: active,
    updated_at: time3
  )
  term.create_bookmark(
    url: "#{sample_term} #{SecureRandom.hex(3)}",
    page_number: rand(0..30),
    created_at: time2
  )
end
