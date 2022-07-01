# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# tag: "tag",
#   description: nil,
#   name: "test case",
#   steps: "{\"steps\":[[\"this is a test\",\"this a data\",\"the result\"]]}",



# 100.times do |index|
#     Test
#         .new(tag: 'Auto_g_test',
#             name: "test_num_#{index}",
#             status: ['passed', 'failed', nil].sample)
#         .save

#     end


Test.destroy_all
Project.destroy_all
ProjectUser.all