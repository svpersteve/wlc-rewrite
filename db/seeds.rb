# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hackroom_one = Hackroom.find_or_create_by!(
                name: 'Ruby',
                colour: '#af1401',
                image: 'https://s3.eu-west-2.amazonaws.com//wlcavatars/uploads/language/image/1/ruby.jpg',
                description: 'Some details about this language',
                long_description: 'More details about this hackroom')

@hackroom_two = Hackroom.find_or_create_by!(
                name: 'iOS',
                colour: '#ef5138',
                image: 'https://s3.eu-west-2.amazonaws.com//wlcavatars/uploads/language/image/4/swift.png',
                description: 'Some details about this language',
                long_description: 'More details about this hackroom')

@hackroom_three = Hackroom.find_or_create_by!(
                name: 'Python',
                colour: '#68d89b',
                image: 'https://s3.eu-west-2.amazonaws.com//wlcavatars/uploads/language/image/2/python.jpg',
                description: 'Some details about this language',
                long_description: 'More details about this hackroom')

@hackroom_four = Hackroom.find_or_create_by!(
                name: 'Front End',
                colour: '#f2d50a',
                image: 'https://s3.eu-west-2.amazonaws.com//wlcavatars/uploads/language/image/5/js.png',
                description: 'Some details about this language',
                long_description: 'More details about this hackroom')

HackroomLeader.find_or_create_by!(member: Member.first, hackroom: @hackroom_one)
