# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-1')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-2')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-3')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-4')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-5')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!-6')
