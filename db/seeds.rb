eli    = Person.where(name: "Eli Fatsi").first_or_create
pat    = Person.where(name: "Pat Reagan").first_or_create
blair = Person.where(name: "Blair Culbreth").first_or_create

q1 = Question.where(title: "Is this person a man or a woman?").first_or_create
a11 = q1.answers.where(title: "Man").first_or_create
a11.people = [eli, pat]
a12 = q1.answers.where(title: "Woman").first_or_create
a12.people = [blair]

q2 = Question.where(title: "Is this person senile or not?").first_or_create
a21 = q2.answers.where(title: "Yes").first_or_create
a21.people = [pat]
a22 = q2.answers.where(title: "No").first_or_create
a22.people = [eli, blair]
