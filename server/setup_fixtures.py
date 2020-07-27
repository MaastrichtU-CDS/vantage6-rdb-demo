from uuid import uuid1

# create a second organization to collaborate with
maastro = db.Organization(
    name="MAASTRO Clinic",
    domain="maastro.nl",
    address1="Dr. Tanslaan 12",
    address2="Maastricht",
    zipcode="6229ET",
    country="Maastricht"
)
maastro.save()

mumc = db.Organization(
    name="Maastricht University Medical Center",
    domain="mumc.nl",
    address1="Dr. Tanslaan 12",
    address2="Maastricht",
    zipcode="6229ET",
    country="Maastricht"
)
mumc.save()

# create the new users
new_user = db.User(
    username="johan",
    password="1234",
    firstname="Johan", 
    lastname="van Soest", 
    roles="researcher",
    organization=maastro
)

# store the user in the database
new_user.save()

# create the collaboration
collaboration = db.Collaboration(
    name="demo-maastro-mumc", 
    encrypted=False,
    organizations=[maastro, mumc]
)

# store the collaboration in the database
collaboration.save()

nodeMaastro = db.Node(
    name = f"MAASTRO Node - Collaboration {collaboration.name}",
    organization = maastro,
    collaboration = collaboration,
    api_key = "2bb02b20-d035-11ea-9365-0242ac110002"#str(uuid1())
)

nodeMaastro.save()
print("api Maastro: %s" % nodeMaastro.api_key)

nodeMumc = db.Node(
    name = f"MUMC Node - Collaboration {collaboration.name}",
    organization = mumc,
    collaboration = collaboration,
    api_key = "414a303e-d035-11ea-9365-0242ac110002"#str(uuid1())
)

nodeMumc.save()
print("api MUMC: %s" % nodeMumc.api_key)