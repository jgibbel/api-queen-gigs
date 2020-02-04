# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
InviteVenue.destroy_all
InvitePerformer.destroy_all
User.destroy_all
Performer.destroy_all
Venue.destroy_all
Gig.destroy_all


ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end


User.create(name: "james", 
            email: "jamesgibbel@gmail.com", 
            location:"NYC", 
            password:"password")

Performer.create(name: "Patti Spliff", 
                    password:"password", 
                    email: "patti@spliff", 
                    bio: "Patti", 
                    photo: "https://pbs.twimg.com/media/CXWUA_IWsAAJunG.png", 
                    social_media: {})

Performer.create(name: "Momo Shade", 
                    password:"password", 
                    email: "momo@shade", 
                    bio: "Momo Shade Haus of Aja", 
                    photo: "https://pbs.twimg.com/media/C5NkApPWMAAqhwt.jpg", 
                    social_media: {})

Performer.create(name: "God Complex", 
                    password:"password", 
                    email: "god@complex", 
                    bio: "God", 
                    photo: "https://images.squarespace-cdn.com/content/v1/52d16385e4b083081e02c3b4/1546744059746-TLWOQXKNHF00YXWWWXJD/ke17ZwdGBToddI8pDm48kC-mbj3Pe87Icl6b-MqMfht7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmlMqpINHCYwrjchQjceiMlbgnqAbeC6Uej22mPtifJu59ZR9MN1xkPENAU_YlqnzI/IMG_0495.JPG", 
                    social_media: {})

Performer.create(name: "Serena Tea", 
                    password:"password", 
                    email: "serena@dtea", 
                    bio: "Miss Bushwig 2019", 
                    photo: "https://dazedimg-dazedgroup.netdna-ssl.com/1050/azure/dazed-prod/1270/6/1276211.jpg", 
                    social_media: {})

Performer.create(name: "Brita Filter", 
                    password:"password", 
                    email: "brita@filter", 
                    bio: "Brita", 
                    photo: "https://getoutmag.com/wp-content/uploads/2017/03/Brita4.jpg", 
                    social_media: {})

Performer.create(name: "Charlene", 
                    password:"password", 
                    email: "char@lene", 
                    bio: "Charlene", 
                    photo: "https://media.them.us/photos/5a9e4232f9a8760021d89307/master/w_2575,h_1472,c_limit/charlene2.jpg", 
                    social_media: {})



Venue.create(name: "Pieces",
                password:"password", 
                email: "pieces@pieces", 
                address: "8 Christopher St, New York, NY 10014", 
                latitude: 70.5, longitude: 45.5, 
                bio: "the place to be", 
                photo: "http://2.bp.blogspot.com/-8tUXobUgGtY/Tt9iiJIkLEI/AAAAAAAAO_E/I29cHKC81rk/s1600/screen-capture-4.jpg", 
                social_media: {})

Venue.create(name: "The Monster",
                password:"password", 
                email: "monster@monster", 
                address: "80 Grove St, New York, NY 10014", 
                latitude: 70.45, 
                longitude: 45.25, 
                bio: "the other place to be", 
                photo: "https://www.nycgo.com/images/venues/34051/the-monster-bar-west-village-manhattan-nyc-courtesy-monster-bar-01__large.jpg", 
                social_media: {})

Venue.create(name: "Metropolitan",
                password:"password", 
                email: "metro@politan", 
                address: "559 Lorimer St, Brooklyn, NY 11211", 
                latitude: 70.5, longitude: 45.5, 
                bio: "the place to be", 
                photo: "https://i2.wp.com/bedfordandbowery.com/wp-content/uploads/2019/02/best-gay-bar-brooklyn-metropolitan.w700.h467.2x.jpg?resize=1400%2C934", 
                social_media: {})

Venue.create(name: "The Rosemont",
                password:"password", 
                email: "the@rosemont", 
                address: "63 Montrose Ave, Brooklyn, NY 11206", 
                latitude: 70.45, 
                longitude: 45.25, 
                bio: "the other place to be", 
                photo: "https://media.timeout.com/images/105276248/630/472/image.jpg", 
                social_media: {})

Gig.create(name: "Patti Spliff at Pieces",
            date: "2019-11-30",
            time: "10pm-4am",
            poster: "https://i.pinimg.com/originals/e3/74/d7/e374d79bf691eac0f477fe149944d905.jpg",
            description: "Patti Spliff at Pieces",
            age: true,
            category: "shows",
            published: true,
            latitude: "null",
            longitude: "null",
            host_id: 1,
            host_type: "Performer",
            venue_name: "Pieces",
            venue_address: "8 Christopher St, New York, NY 10014")
InvitePerformer.create({performer_id: 1, gig_id: 1, admin: true})
InviteVenue.create({venue_id: 1, gig_id: 1, admin: true})

Gig.create(name: "Brita Filter at Pieces",
            date: "2019-11-30",
            time: "10pm-4am",
            poster: "https://www.pixelandplume.com/wp-content/uploads/2017/05/Pixel-and-Plume-Design-Co-Posters-_0008_2016-Femme-Fatale-v2.png",
            description: "Brita Filter at Pieces",
            age: true,
            category: "shows",
            published: true,
            latitude: "null",
            longitude: "null",
            host_id: 5,
            host_type: "Performer",
            venue_name: "Pieces",
            venue_address: "8 Christopher St, New York, NY 10014")
InvitePerformer.create({performer_id: 5, gig_id: 2, admin: true})
InviteVenue.create({venue_id: 1, gig_id: 2, admin: true})

Gig.create(name: "Momo Shade at The Monster",
            date: "2019-11-30",
            time: "10pm-4am",
            poster: "http://spoox.net/uploads/3/4/6/0/34602772/battleroyaleposter2-2jpg.jpg",
            description: "Momo Shade at The Monster",
            age: true,
            category: "shows",
            published: true,
            latitude: "null",
            longitude: "null",
            host_id: 2,
            host_type: "Performer",
            venue_name: "The Monster",
            venue_address: "80 Grove St, New York, NY 10014")
InvitePerformer.create({performer_id: 2, gig_id: 3, admin: true})
InviteVenue.create({venue_id: 2, gig_id: 3, admin: true})

Gig.create(name: "God Complex at The Monster",
            date: "2019-11-30",
            time: "10pm-4am",
            poster: "https://i.pinimg.com/originals/94/05/c3/9405c37084c2bd675974ed8a420fde72.jpg",
            description: "God Complex at The Monster",
            age: true,
            category: "shows",
            published: true,
            latitude: "null",
            longitude: "null",
            host_id: 3,
            host_type: "Performer",
            venue_name: "The Monster",
            venue_address: "80 Grove St, New York, NY 10014")
InvitePerformer.create({performer_id: 3, gig_id: 4, admin: true})
InviteVenue.create({venue_id: 2, gig_id: 4, admin: true})