
User.destroy_all

admin = User.new
admin.password = "123456"
admin.email = "idiot@stupid.com"
admin.save!

jlpt4_set = StudySet.new
