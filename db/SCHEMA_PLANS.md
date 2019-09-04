Models

  -Teachers
    username :string
    email :string
    password-digest :string
    course_level :integer (1-5)

  -Students
    username :string
    email :string
    password-digest :string
    course_level :integer (1-5)

  -Materials
    url :string
    course_level :integer (1-5)

  -Assignments
    material_id :integer
    student_id :integer
    mark_as_viewed :boolean
