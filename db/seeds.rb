brian_williams   = Person.where(name: "Brian Williams").first_or_create
andy_rankin      = Person.where(name: "Andy Rankin").first_or_create
albert_wavering  = Person.where(name: "Albert Wavering").first_or_create
ally_fouts       = Person.where(name: "Ally Fouts").first_or_create
amanda_reuhlen   = Person.where(name: "Amanda Reuhlen").first_or_create
annie_kiley      = Person.where(name: "Annie Kiley").first_or_create
beaumont_smith   = Person.where(name: "Beaumont Smith").first_or_create
becca_james      = Person.where(name: "Becca James").first_or_create
becky_tornes     = Person.where(name: "Becky Tornes").first_or_create
ben_travis       = Person.where(name: "Ben Travis").first_or_create
ben_eckerson     = Person.where(name: "Ben Eckerson").first_or_create
ben_tinsley      = Person.where(name: "Ben Tinsley").first_or_create
billy_french     = Person.where(name: "Billy French").first_or_create
blair_culbreth   = Person.where(name: "Blair Culbreth").first_or_create
brandon_dorn     = Person.where(name: "Brandon Dorn").first_or_create
brian_landau     = Person.where(name: "Brian Landau").first_or_create
chris_manning    = Person.where(name: "Chris Manning").first_or_create
chris_jones      = Person.where(name: "Chris Jones").first_or_create
cindy_caldwell   = Person.where(name: "Cindy Caldwell").first_or_create
claire_atwell    = Person.where(name: "Claire Atwell").first_or_create
curt_arledge     = Person.where(name: "Curt Arledge").first_or_create
dan_tello        = Person.where(name: "Dan Tello").first_or_create
david_eisinger   = Person.where(name: "David Eisinger").first_or_create
eli_fatsi        = Person.where(name: "Eli Fatsi").first_or_create
elliott_munoz    = Person.where(name: "Elliott Munoz").first_or_create
emily_bloom      = Person.where(name: "Emily Bloom").first_or_create
grace_canfield   = Person.where(name: "Grace Canfield").first_or_create
greg_kohn        = Person.where(name: "Greg Kohn").first_or_create
heather_muety    = Person.where(name: "Heather Muety").first_or_create
henry_bley       = Person.where(name: "Henry Bley").first_or_create
jackson_fox      = Person.where(name: "Jackson Fox").first_or_create
jason_toth       = Person.where(name: "Jason Toth").first_or_create
jenny_nguyen     = Person.where(name: "Jenny Nguyen").first_or_create
jeremy_fields    = Person.where(name: "Jeremy Fields").first_or_create
jeremy_frank     = Person.where(name: "Jeremy Frank").first_or_create
josh_korr        = Person.where(name: "Josh Korr").first_or_create
justin_sinichko  = Person.where(name: "Justin Sinichko").first_or_create
kaitlyn_irvine   = Person.where(name: "Kaitlyn Irvine").first_or_create
katherine_olvera = Person.where(name: "Katherine Olvera").first_or_create
kelly_kenny      = Person.where(name: "Kelly Kenny").first_or_create
kevin_powers     = Person.where(name: "Kevin Powers").first_or_create
kevin_v_igneault = Person.where(name: "Kevin VIgneault").first_or_create
khanh_stenberg   = Person.where(name: "Khanh Stenberg").first_or_create
laura_sweltz     = Person.where(name: "Laura Sweltz").first_or_create
leo_bauza        = Person.where(name: "Leo Bauza").first_or_create
megan_zlock      = Person.where(name: "Megan Zlock").first_or_create
mike_ackerman    = Person.where(name: "Mike Ackerman").first_or_create
mindy_wagner     = Person.where(name: "Mindy Wagner").first_or_create
minh_tran        = Person.where(name: "Minh Tran").first_or_create
mitch_daniels    = Person.where(name: "Mitch Daniels").first_or_create
natalie_reich    = Person.where(name: "Natalie Reich").first_or_create
nate_hunzaker    = Person.where(name: "Nate Hunzaker").first_or_create
owen_shifflett   = Person.where(name: "Owen Shifflett").first_or_create
pascale_georges  = Person.where(name: "Pascale Georges").first_or_create
patrick_reagan   = Person.where(name: "Patrick Reagan").first_or_create
paul_koch        = Person.where(name: "Paul Koch").first_or_create
peyton_crump     = Person.where(name: "Peyton Crump").first_or_create
ryan_stenberg    = Person.where(name: "Ryan Stenberg").first_or_create
samantha_freda   = Person.where(name: "Samantha Freda").first_or_create
samara_strauss   = Person.where(name: "Samara Strauss").first_or_create
sarah_schraer    = Person.where(name: "Sarah Schraer").first_or_create
solomon_hawk     = Person.where(name: "Solomon Hawk").first_or_create
tom_osborne      = Person.where(name: "Tom Osborne").first_or_create
tommy_marshall   = Person.where(name: "Tommy Marshall").first_or_create
trevor_davis     = Person.where(name: "Trevor Davis").first_or_create
zach_robbins     = Person.where(name: "Zach Robbins").first_or_create
zachary_porter   = Person.where(name: "Zachary Porter").first_or_create

q1 = Question.where(title: "Is this person a man or a woman?").first_or_create
a11 = q1.answers.where(title: "man").first_or_create
a11.people = [emily_bloom,grace_canfield,greg_kohn,heather_muety,henry_bley,jackson_fox,jason_toth,jenny_nguyen,jeremy_fields,jeremy_frank,josh_korr,justin_sinichko,kaitlyn_irvine,katherine_olvera,kelly_kenny,kevin_powers,kevin_v_igneault,khanh_stenberg,laura_sweltz,leo_bauza,megan_zlock,mike_ackerman,mindy_wagner,minh_tran,mitch_daniels,natalie_reich,nate_hunzaker,owen_shifflett,pascale_georges,patrick_reagan,paul_koch,peyton_crump,ryan_stenberg,samantha_freda,samara_strauss,sarah_schraer,solomon_hawk,tom_osborne,tommy_marshall,trevor_davis,zach_robbins,zachary_porter]
a12 = q1.answers.where(title: "woman").first_or_create
a12.people = [brian_williams,andy_rankin,albert_wavering,ally_fouts,amanda_reuhlen,annie_kiley,beaumont_smith,becca_james,becky_tornes,ben_travis,ben_eckerson,ben_tinsley,billy_french,blair_culbreth,brandon_dorn,brian_landau,chris_manning,chris_jones,cindy_caldwell,claire_atwell,curt_arledge,dan_tello,david_eisinger,eli_fatsi,elliott_munoz,patrick_reagan]

q2 = Question.where(title: "Is this person senile or not?").first_or_create
a21 = q2.answers.where(title: "yes").first_or_create
a21.people = [patrick_reagan]
a22 = q2.answers.where(title: "no").first_or_create
a22.people = [brian_williams,
  andy_rankin,
  albert_wavering,
  ally_fouts,
  amanda_reuhlen,
  annie_kiley,
  beaumont_smith,
  becca_james,
  becky_tornes,
  ben_travis,
  ben_eckerson,
  ben_tinsley,
  billy_french,
  blair_culbreth,
  brandon_dorn,
  brian_landau,
  chris_manning,
  chris_jones,
  cindy_caldwell,
  claire_atwell,
  curt_arledge,
  dan_tello,
  david_eisinger,
  eli_fatsi,
  elliott_munoz,
  emily_bloom,
  grace_canfield,
  greg_kohn,
  heather_muety,
  henry_bley,
  jackson_fox,
  jason_toth,
  jenny_nguyen,
  jeremy_fields,
  jeremy_frank,
  josh_korr,
  justin_sinichko,
  kaitlyn_irvine,
  katherine_olvera,
  kelly_kenny,
  kevin_powers,
  kevin_v_igneault,
  khanh_stenberg,
  laura_sweltz,
  leo_bauza,
  megan_zlock,
  mike_ackerman,
  mindy_wagner,
  minh_tran,
  mitch_daniels,
  natalie_reich,
  nate_hunzaker,
  owen_shifflett,
  pascale_georges,
  paul_koch,
  peyton_crump,
  ryan_stenberg,
  samantha_freda,
  samara_strauss,
  sarah_schraer,
  solomon_hawk,
  tom_osborne,
  tommy_marshall,
  trevor_davis,
  zach_robbins,
  zachary_porter
]
