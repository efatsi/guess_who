eli_fatsi      = Person.where(name: "Eli Fatsi").first_or_create
patrick_reagan = Person.where(name: "Patrick Reagan").first_or_create
blair_culbreth = Person.where(name: "Blair Culbreth").first_or_create

q1 = Question.where(title: "Is this person a man or a woman?").first_or_create
a11 = q1.answers.where(title: "Man").first_or_create
a11.people = [eli_fatsi, patrick_reagan]
a12 = q1.answers.where(title: "Woman").first_or_create
a12.people = [blair_culbreth]

q2 = Question.where(title: "Is this person senile or not?").first_or_create
a21 = q2.answers.where(title: "Yes").first_or_create
a21.people = [patrick_reagan]
a22 = q2.answers.where(title: "No").first_or_create
a22.people = [eli_fatsi, blair_culbreth]
