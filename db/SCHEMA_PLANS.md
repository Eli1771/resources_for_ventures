Models

  -Teachers
    name :string
    email :string
    password-digest :string
    course_level :integer (1-5)

    #has many students through students_teachers


  -Students
    name :string
    email :string
    password-digest :string
    course_level :integer (1-5)

    #has many teachers through students_teachers
    #has many materials through assignments


  -Students_teachers
    student_id :integer
    teacher_id :integer

    #belongs to student
    #belongs to teacher


  -Materials
    url :string
    course_level :integer (1-5)

    #has many assignments
    #has many students through assignments


  -Assignments
    material_id :integer
    student_id :integer
    mark_as_viewed :boolean

    #belongs to material
    #belongs to student
