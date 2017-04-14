puts "Seeding FLF question"

question = Question.where(
  title: "Is this person a regular contributor to free lunch friday?"
).first_or_create

{
  "Albert Wavering"   => "no",
  "Ally Fouts"        => "no",
  "Amanda Ruehlen"    => "no",
  "Andy Rankin"       => "no",
  "Annie Kiley"       => "no",
  "Becca James"       => "no",
  "Becky Tornes"      => "no",
  "Ben Tinsley"       => "yes",
  "Ben Eckerson"      => "yes",
  "Ben Travis"        => "yes",
  "Billy French"      => "yes",
  "Blair Culbreth"    => "no",
  "Brandon Dorn"      => "yes",
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
  "Emily Bloom"       => "yes",
  "Grace Canfield"    => "no",
  "Greg Kohn"         => "no",
  "Heather Muety"     => "no",
  "Henry Bley-Vroman" => "no",
  "Ian Brennan"       => "no",
  "Jackson Fox"       => "no",
  "Jason Toth"        => "no",
  "Jeremy Frank"      => "no",
  "Jeremy Fields"     => "no",
  "Josh Korr"         => "yes",
  "Justin Sinichko"   => "no",
  "Kaitlyn Irvine"    => "yes",
  "Katherine Olvera"  => "no",
  "Kelly Kenny"       => "no",
  "Kevin Vigneault"   => "no",
  "Kevin Powers"      => "no",
  "Khanh Stenberg"    => "no",
  "Laura Sweltz"      => "yes",
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
  "Paul Koch"         => "no",
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
