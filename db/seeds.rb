# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# moderator = Moderator.create(
#     full_name: 'Ghulam Abbas',
#     user_name: 'admin@admin.com',
#     password: 'admin'
# )

moderator = Moderator.create(
  full_name: 'Ghulam Abbas',
  user_name: 'admin@admin.com',
  password: 'admin'
)

1.times do
  group1 = Group.create(name: 'Group-I', max_marks: 200)
  group2 = Group.create(name: 'Group-II', max_marks: 200)
  group3 = Group.create(name: 'Group-III', max_marks: 100)
  group4 = Group.create(name: 'Group-IV', max_marks: 100)
  group5 = Group.create(name: 'Group-V', max_marks: 100)
  group6 = Group.create(name: 'Group-VI', max_marks: 100)
  group7 = Group.create(name: 'Group-VII', max_marks: 100)
  group8 = Group.create(name: 'Compulsory', max_marks: 100)
# Group 1
  subjec1 = Subject.create(name: 'Accountancy & Auditing', marks: 200, code_no: 11, compulsory: false, group_id: 1)
  subjec2 = Subject.create(name: 'Economics', marks: 200, code_no: 12, compulsory: false, group_id: 1)
  subjec3 = Subject.create(name: 'Computer Science', marks: 200, code_no: 13, compulsory: false, group_id: 1)
  subjec4 = Subject.create(name: 'Political Science', marks: 200, code_no: 14, compulsory: false, group_id: 1)
  subjec5 = Subject.create(name: 'International Relations', marks: 200, code_no: 15, compulsory: false, group_id: 1)

# Group2
  subject6 = Subject.create(name: 'Physics', marks: 200, code_no: 16, compulsory: false, group_id: 2)
  subject7 = Subject.create(name: 'Chemistry', marks: 200, code_no: 17, compulsory: false, group_id: 2)
  subject8 = Subject.create(name: 'Applied Mathematics', marks: 100, code_no: 18, compulsory: false, group_id: 2)
  subject9 = Subject.create(name: 'Pure Mathematics', marks: 100, code_no: 19, compulsory: false, group_id: 2)
  subject10 = Subject.create(name: 'Statistics', marks: 100, code_no: 20, compulsory: false, group_id: 2)
  subject11 = Subject.create(name: 'Geology', marks: 100, code_no: 21, compulsory: false, group_id: 2)

# Group3
  subject12 = Subject.create(name: 'Business Administration', marks: 100, code_no: 22, compulsory: false, group_id: 3)
  subject13 = Subject.create(name: 'Public Administration', marks: 100, code_no: 23, compulsory: false, group_id: 3)
  subject14 = Subject.create(name: 'Governance & Public Policies', marks: 100, code_no: 24, compulsory: false, group_id: 3)
  subject15 = Subject.create(name: 'Town Planning & Urban Management', marks: 100, code_no: 25, compulsory: false, group_id: 3)

# Group4
  subject16 = Subject.create(name: 'History of Pakistan & India', marks: 100, code_no: 26, compulsory: false, group_id: 4)
  subject17 = Subject.create(name: 'Islamic History & Culture', marks: 100, code_no: 27, compulsory: false, group_id: 4)
  subject18 = Subject.create(name: 'British History', marks: 100, code_no: 28, compulsory: false, group_id: 4)
  subject19 = Subject.create(name: 'European History', marks: 100, code_no: 29, compulsory: false, group_id: 4)
  subject20 = Subject.create(name: 'History of USA', marks: 100, code_no: 30, compulsory: false, group_id: 4)

# Group5
  subject21 = Subject.create(name: 'Gender Studies', marks: 100, code_no: 31, compulsory: false, group_id: 5)
  subject22 = Subject.create(name: 'Environmental Sciences', marks: 100, code_no: 32, compulsory: false, group_id: 5)
  subject23 = Subject.create(name: 'Agriculture & Forestry', marks: 100, code_no: 33, compulsory: false, group_id: 5)
  subject24 = Subject.create(name: 'Botany', marks: 100, code_no: 34, compulsory: false, group_id: 5)
  subject25 = Subject.create(name: 'Zoology', marks: 100, code_no: 35, compulsory: false, group_id: 5)
  subject26 = Subject.create(name: 'English Literature', marks: 100, code_no: 36, compulsory: false, group_id: 5)
  subject27 = Subject.create(name: 'Urdu Literature', marks: 100, code_no: 37, compulsory: false, group_id: 5)

# Group6
  subject28 = Subject.create(name: 'Law', marks: 100, code_no: 38, compulsory: false, group_id: 6)
  subject29 = Subject.create(name: 'Constitutional Law', marks: 100, code_no: 39, compulsory: false, group_id: 6)
  subject30 = Subject.create(name: 'International Law', marks: 100, code_no: 40, compulsory: false, group_id: 6)
  subject31 = Subject.create(name: 'Muslim Law & Jurisprudence', marks: 100, code_no: 41, compulsory: false, group_id: 6)
  subject32 = Subject.create(name: 'Mercantile Law', marks: 100, code_no: 42, compulsory: false, group_id: 6)
  subject33 = Subject.create(name: 'Criminology', marks: 100, code_no: 43, compulsory: false, group_id: 6)
  subject34 = Subject.create(name: 'Philosophy', marks: 100, code_no: 44, compulsory: false, group_id: 6)

# Group7
  subject35 = Subject.create(name: 'Journalism & Mass Communication', marks: 100, code_no: 45, compulsory: false, group_id: 7)
  subject36 = Subject.create(name: 'Psychology', marks: 100, code_no: 46, compulsory: false, group_id: 7)
  subject37 = Subject.create(name: 'Geography', marks: 100, code_no: 47, compulsory: false, group_id: 7)
  subject38 = Subject.create(name: 'Sociology', marks: 100, code_no: 48, compulsory: false, group_id: 7)
  subject39 = Subject.create(name: 'Anthropology', marks: 100, code_no: 49, compulsory: false, group_id: 7)
  subject40 = Subject.create(name: 'Punjabi', marks: 100, code_no: 50, compulsory: false, group_id: 7)
  subject41 = Subject.create(name: 'Sindhi', marks: 100, code_no: 51, compulsory: false, group_id: 7)
  subject42 = Subject.create(name: 'Pashto', marks: 100, code_no: 52, compulsory: false, group_id: 7)
  subject43 = Subject.create(name: 'Balochi', marks: 100, code_no: 53, compulsory: false, group_id: 7)
  subject44 = Subject.create(name: 'Persian', marks: 100, code_no: 54, compulsory: false, group_id: 7)
  subject45 = Subject.create(name: 'Arabic', marks: 100, code_no: 55, compulsory: false, group_id: 7)

# Compulsory
  subject46 = Subject.create(name: 'English Essay', marks: 100, code_no: 1, compulsory: true, group_id: 8)
  subject47 = Subject.create(name: 'English (Precis and Composition)', marks: 100, code_no: 2, compulsory: true, group_id: 8)
  subject48 = Subject.create(name: 'General Science & Ability', marks: 100, code_no: 3, compulsory: true, group_id: 8)
  subject49 = Subject.create(name: 'Current Affairs', marks: 100, code_no: 4, compulsory: true, group_id: 8)
  subject50 = Subject.create(name: 'Pakistan Affairs', marks: 100, code_no: 5, compulsory: true, group_id: 8)
  subject51 = Subject.create(name: 'Islamic Studies OR Comparative Study of Major Religions (For Non Muslims)', marks: 100, code_no: 6, compulsory: true, group_id: 8)
end

30.times do
  post = Post.create(
      title: Faker::Lorem.sentence(word_count: 20),
      content: Faker::Lorem.paragraph,
      publish: true,
      subject_id: rand(1..51),
      moderator: moderator
  )

  tag = Tag.create(name: Faker::Lorem.word)

  post_tag = PostTag.create(post: post, tag: tag)

  visitor = Visitor.create(
      full_name: Faker::Name.name,
      email: Faker::Internet.email
  )

  comment = Comment.create(
      message: Faker::Lorem.paragraph,
      status: [true, false].sample,
      post: post,
      visitor: visitor
  )

  message = Message.create(
      content: Faker::Lorem.paragraph,
      status: [true, false].sample,
      visitor: visitor
  )

  notifiable = [visitor, comment].sample

  notification = Notification.create(
      notifiable_id: notifiable.id,
      notifiable_type: notifiable.class.name
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.production?