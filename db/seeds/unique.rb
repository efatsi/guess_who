puts "Seeding unique questions"

{
  "Albert Wavering"   => "Does this person have a pet hedgehog?",
  "Ally Fouts"        => "Does this person brand themselves as rothgarg on social media?",
  "Amanda Ruehlen"    => "Is this person most likely to dole out demerits?",
  "Andy Rankin"       => "Did this person pay for me to be created?",
  "Annie Kiley"       => "Does this person teach for Railsbridge in their spare time?",
  "Becca James"       => "Was this person a taste researcher in a past professional life?",
  "Becky Tornes"      => "Is this person the biggest Vikings fan in the world?",
  "Ben Tinsley"       => "Is this person most likely to use the phrase 'rise up' in conversation?",
  "Ben Eckerson"      => "Did this person once live in a snowglobe for 3 days?",
  "Ben Travis"        => "Can this person salsa dance circles around you?",
  "Billy French"      => "Did this person originally come up with the Tuna Sock startup idea to which he's since given away?",
  "Blair Culbreth"    => "Is this person dating Doug Avery?",
  "Brandon Dorn"      => "Does this person constantly change their avatar on slack to various Sufjan Stevens pictures?",
  "Brian Williams"    => "Does this person have a trademarked guarantee for times of enjoyment?",
  "Chris Manning"     => "Don't laugh, but is this person a Browns fan?",
  "Chris Jones"       => "Is this person generally awesome at everything they do like cooking, piano, improv, or crossfit?",
  "Cindy Caldwell"    => "Is this person a pub quiz champion?",
  "Claire Atwell"     => "Is this person the biggest UNC fan, but somehow dates a Duke grad?",
  "Curt Arledge"      => "Was this person once known as the Mantern?",
  "Dan Tello"         => "Is this person an expert nose flute player?",
  "David Eisinger"    => "Does this person have a bird named Tad?",
  "Elias Fatsi"       => "Does this person have a flip phone?",
  "Elliott Muñoz"     => "Did this person once work for the failing Washington Post? SAD.",
  "Emily Bloom"       => "This person looks awesome in her new hair do, right?",
  "Grace Canfield"    => "Does this person sometimes lurk on slack?",
  "Greg Kohn"         => "Did this person bike a long way across America?",
  "Heather Muety"     => "Does this person have two adorable J. Crew child models for sons?",
  "Henry Bley-Vroman" => "Does this person objectively have the best mustache at the company?",
  "Ian Brennan"       => "This is the new guy with the drones right?",
  "Jackson Fox"       => "Is this person the first to ever get hired twice at Viget?",
  "Jason Toth"        => "Does this person think Forrest Gump is highly overrated?",
  "Jeremy Frank"      => "Does this person love to watch and play Tennis?",
  "Jeremy Fields"     => "Would this person rather be biking right now?",
  "Josh Korr"         => "Does this person have a serious knack for writing controversal blog posts?",
  "Justin Sinichko"   => "Is this person my creator?",
  "Kaitlyn Irvine"    => "Does this person know the difference between a trail marathon and a regular marathon?",
  "Katherine Olvera"  => "Is it possible this person designed one of your purses at some point?",
  "Kelly Kenny"       => "Is this person most often pictured in a red painted room when on hangouts?",
  "Kevin Vigneault"   => "Is this person smarter than you, yet somehow lives in Maryland?",
  "Kevin Powers"      => "Does this person occasionally work remotely internationally?",
  "Khanh Stenberg"    => "Does this person have a work husband who is their actual husband?",
  "Laura Sweltz"      => "Would this person prefer that you call them Steak Money?",
  "Leo Bauza"         => "Does this person know what College Billy French was like?",
  "Megan Zlock"       => "Did this person sell their TTT painting over Slack?",
  "Mike Ackerman"     => "Is this person probably the tallest person at Viget?",
  "Mindy Wagner"      => "Did this person once rock JNCO jeans in Upstate New York?",
  "Minh Tran"         => "Would this person be more comfortable hanging from or climbing a rock or mountain?",
  "Mitch Daniels"     => "Did this person frequently dress up in a large bird outfit in college?",
  "Natalie Reich"     => "Is this person really comfortable talking about politics?",
  "Nate Hunzaker"     => "Is this person probably a wizard?",
  "Owen Shifflett"    => "Have you ever met a more talkative person who also practices meditation than this person?",
  "Patrick Reagan"    => "Do you know about the chem trails? He does right?",
  "Pascale Georges"   => "Is their phone number 305-607-9541?",
  "Paul Koch"         => "Did this person go on the Price Is Right and create one of the most legendary Viget GIFs ever?",
  "Peyton Crump"      => "Let's be honest. This person is really Tommy, right?",
  "Ryan Stenberg"     => "Does this person have a work wife who is their actual wife?",
  "Samantha Freda"    => "Does this person drive a red honda civic?",
  "Samara Strauss"    => "Does this person know Jason Garber better than any of us?",
  "Sarah Schraer"     => "Is this person an award winning office ninja?",
  "Solomon Hawk"      => "Does this person eat a meal known as Lupper?",
  "Tom Osborne"       => "Does this person's Viget story start in an airport?",
  "Trevor Davis"      => "Does this person sometimes work from home in tank tops?",
  "Zach Robbins"      => "Is this person likely responsible for building your desk surface, conference table or room doors?",
  "Zachary Porter"    => "Does this person have more kids and play more video games than you?",
}.each do |name, question|
  person   = Person.find_by(name: name)
  question = Question.where(title: question, specific: true).first_or_create

  Person.all.each do |plebian|
    answer = if person == plebian
      question.answers.where(title: "yes").first_or_create
    else
      question.answers.where(title: "no").first_or_create
    end

    answer.people << plebian unless answer.people.include?(plebian)
  end
end
