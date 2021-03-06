puts "Seeding UX question"

question = Question.where(
  title: "Is this person part of the UX team?"
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
  "Blair Culbreth"    => "no",
  "Brandon Dorn"      => "yes",
  "Brian Williams"    => "no",
  "Chris Manning"     => "no",
  "Chris Jones"       => "no",
  "Cindy Caldwell"    => "no",
  "Claire Atwell"     => "no",
  "Curt Arledge"      => "yes",
  "Dan Tello"         => "no",
  "David Eisinger"    => "no",
  "Elias Fatsi"       => "no",
  "Elliott Muñoz"     => "no",
  "Emily Bloom"       => "no",
  "Grace Canfield"    => "no",
  "Greg Kohn"         => "no",
  "Heather Muety"     => "no",
  "Henry Bley-Vroman" => "no",
  "Ian Brennan"       => "no",
  "Jackson Fox"       => "yes",
  "Jason Toth"        => "yes",
  "Jeremy Frank"      => "no",
  "Jeremy Fields"     => "no",
  "Josh Korr"         => "no",
  "Justin Sinichko"   => "no",
  "Kaitlyn Irvine"    => "no",
  "Katherine Olvera"  => "yes",
  "Kelly Kenny"       => "no",
  "Kevin Vigneault"   => "yes",
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
  "Samara Strauss"    => "yes",
  "Sarah Schraer"     => "no",
  "Solomon Hawk"      => "no",
  "Tom Osborne"       => "no",
  "Trevor Davis"      => "no",
  "Zach Robbins"      => "no",
  "Zachary Porter"    => "no",
}.each do |name, value|
  answer = question.answers.where(title: value).first_or_create
  person = Person.find_by(name: name)

  answer.people << person unless answer.people.include?(person)
end
