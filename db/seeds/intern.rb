puts "Seeding interns question"

question = Question.where(
  title: "Was this person once a young aspiring intern at Viget?"
).first_or_create

{
  "Albert Wavering"   => "no",
  "Ally Fouts"        => "no",
  "Amanda Ruehlen"    => "no",
  "Andy Rankin"       => "no",
  "Annie Kiley"       => "no",
  "Becca James"       => "no",
  "Becky Tornes"      => "no",
  "Ben Tinsley"       => "no",
  "Ben Eckerson"      => "no",
  "Ben Travis"        => "no",
  "Billy French"      => "no",
  "Blair Culbreth"    => "yes",
  "Brandon Dorn"      => "no",
  "Brian Williams"    => "no",
  "Chris Manning"     => "no",
  "Chris Jones"       => "no",
  "Cindy Caldwell"    => "no",
  "Claire Atwell"     => "no",
  "Curt Arledge"      => "no",
  "Dan Tello"         => "no",
  "David Eisinger"    => "no",
  "Elias Fatsi"       => "yes",
  "Elliott Muñoz"     => "no",
  "Emily Bloom"       => "no",
  "Grace Canfield"    => "no",
  "Greg Kohn"         => "no",
  "Heather Muety"     => "no",
  "Henry Bley-Vroman" => "no",
  "Ian Brennan"       => "no",
  "Jackson Fox"       => "no",
  "Jason Toth"        => "no",
  "Jeremy Frank"      => "no",
  "Jeremy Fields"     => "no",
  "Josh Korr"         => "no",
  "Justin Sinichko"   => "no",
  "Kaitlyn Irvine"    => "no",
  "Katherine Olvera"  => "no",
  "Kelly Kenny"       => "no",
  "Kevin Vigneault"   => "no",
  "Kevin Powers"      => "no",
  "Khanh Stenberg"    => "no",
  "Laura Sweltz"      => "no",
  "Leo Bauza"         => "no",
  "Megan Zlock"       => "no",
  "Mike Ackerman"     => "no",
  "Mindy Wagner"      => "no",
  "Minh Tran"         => "no",
  "Mitch Daniels"     => "no",
  "Natalie Reich"     => "no",
  "Nate Hunzaker"     => "no",
  "Owen Shifflett"    => "no",
  "Patrick Reagan"    => "no",
  "Pascale Georges"   => "no",
  "Paul Koch"         => "yes",
  "Peyton Crump"      => "no",
  "Ryan Stenberg"     => "no",
  "Samantha Freda"    => "no",
  "Samara Strauss"    => "no",
  "Sarah Schraer"     => "no",
  "Solomon Hawk"      => "no",
  "Tom Osborne"       => "no",
  "Trevor Davis"      => "no",
  "Zach Robbins"      => "yes",
  "Zachary Porter"    => "no",
}.each do |name, value|
  answer = question.answers.where(title: value).first_or_create
  person = Person.find_by(name: name)

  answer.people << person
end
