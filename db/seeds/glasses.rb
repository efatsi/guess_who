puts "Seeding glasses question"

question = Question.where(
  title: "Does this person wear glasses to work sometimes?"
).first_or_create

{
  "Albert Wavering"   => "yes",
  "Ally Fouts"        => "yes",
  "Amanda Ruehlen"    => "no",
  "Andy Rankin"       => "no",
  "Annie Kiley"       => "no",
  "Becca James"       => "yes",
  "Becky Tornes"      => "no",
  "Ben Tinsley"       => "no",
  "Ben Eckerson"      => "no",
  "Ben Travis"        => "no",
  "Billy French"      => "no",
  "Blair Culbreth"    => "no",
  "Brandon Dorn"      => "yes",
  "Brian Williams"    => "no",
  "Chris Manning"     => "no",
  "Chris Jones"       => "yes",
  "Cindy Caldwell"    => "no",
  "Claire Atwell"     => "no",
  "Curt Arledge"      => "no",
  "Dan Tello"         => "no",
  "David Eisinger"    => "yes",
  "Elias Fatsi"       => "no",
  "Elliott Muñoz"     => "yes",
  "Emily Bloom"       => "no",
  "Grace Canfield"    => "yes",
  "Greg Kohn"         => "no",
  "Heather Muety"     => "no",
  "Henry Bley-Vroman" => "no",
  "Ian Brennan"       => "yes",
  "Jackson Fox"       => "yes",
  "Jason Toth"        => "yes",
  "Jeremy Frank"      => "no",
  "Jeremy Fields"     => "no",
  "Josh Korr"         => "no",
  "Justin Sinichko"   => "no",
  "Kaitlyn Irvine"    => "yes",
  "Katherine Olvera"  => "no",
  "Kelly Kenny"       => "yes",
  "Kevin Vigneault"   => "no",
  "Kevin Powers"      => "yes",
  "Khanh Stenberg"    => "no",
  "Laura Sweltz"      => "yes",
  "Leo Bauza"         => "no",
  "Megan Zlock"       => "yes",
  "Mike Ackerman"     => "no",
  "Mindy Wagner"      => "no",
  "Minh Tran"         => "yes",
  "Mitch Daniels"     => "no",
  "Natalie Reich"     => "no",
  "Nate Hunzaker"     => "no",
  "Owen Shifflett"    => "no",
  "Patrick Reagan"    => "no",
  "Pascale Georges"   => "yes",
  "Paul Koch"         => "no",
  "Peyton Crump"      => "yes",
  "Ryan Stenberg"     => "no",
  "Samantha Freda"    => "no",
  "Samara Strauss"    => "yes",
  "Sarah Schraer"     => "no",
  "Solomon Hawk"      => "yes",
  "Tom Osborne"       => "no",
  "Trevor Davis"      => "no",
  "Zach Robbins"      => "no",
  "Zachary Porter"    => "yes",
}.each do |name, value|
  answer = question.answers.where(title: value).first_or_create
  person = Person.find_by(name: name)

  answer.people << person
end
