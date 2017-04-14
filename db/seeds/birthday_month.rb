puts "Seeding birthday question"

question = Question.where(
  title: "What month was this person born?"
).first_or_create

{
  "Albert Wavering"   => "December",
  "Ally Fouts"        => "December",
  "Amanda Ruehlen"    => "June",
  "Andy Rankin"       => "February",
  "Annie Kiley"       => "January",
  "Becca James"       => "May",
  "Becky Tornes"      => "July",
  "Ben Tinsley"       => "June",
  "Ben Eckerson"      => "January",
  "Ben Travis"        => "April",
  "Billy French"      => "February",
  "Blair Culbreth"    => "August",
  "Brandon Dorn"      => "January",
  "Brian Williams"    => "October",
  "Chris Manning"     => "April",
  "Chris Jones"       => "December",
  "Cindy Caldwell"    => "March",
  "Claire Atwell"     => "May",
  "Curt Arledge"      => "January",
  "Dan Tello"         => "October",
  "David Eisinger"    => "September",
  "Elias Fatsi"       => "June",
  "Elliott Muñoz"     => "May",
  "Emily Bloom"       => "February",
  "Grace Canfield"    => "August",
  "Greg Kohn"         => "November",
  "Heather Muety"     => "October",
  "Henry Bley-Vroman" => "December",
  "Ian Brennan"       => "June",
  "Jackson Fox"       => "August",
  "Jason Toth"        => "January",
  "Jeremy Frank"      => "April",
  "Jeremy Fields"     => "July",
  "Josh Korr"         => "January",
  "Justin Sinichko"   => "April",
  "Kaitlyn Irvine"    => "October",
  "Katherine Olvera"  => "April",
  "Kelly Kenny"       => "August",
  "Kevin Vigneault"   => "August",
  "Kevin Powers"      => "November",
  "Khanh Stenberg"    => "December",
  "Laura Sweltz"      => "June",
  "Leo Bauza"         => "October",
  "Megan Zlock"       => "October",
  "Mike Ackerman"     => "November",
  "Mindy Wagner"      => "April",
  "Minh Tran"         => "March",
  "Mitch Daniels"     => "November",
  "Natalie Reich"     => "June",
  "Nate Hunzaker"     => "April",
  "Owen Shifflett"    => "December",
  "Patrick Reagan"    => "August",
  "Pascale Georges"   => "January",
  "Paul Koch"         => "October",
  "Peyton Crump"      => "November",
  "Ryan Stenberg"     => "January",
  "Samantha Freda"    => "July",
  "Samara Strauss"    => "March",
  "Sarah Schraer"     => "June",
  "Solomon Hawk"      => "November",
  "Tom Osborne"       => "March",
  "Trevor Davis"      => "May",
  "Zach Robbins"      => "June",
  "Zachary Porter"    => "April",
}.each do |name, value|
  answer = question.answers.where(title: value).first_or_create
  person = Person.find_by(name: name)

  answer.people << person
end
