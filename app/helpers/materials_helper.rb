module MaterialsHelper
  def course_id_field(material)
    if material.course.nil?
      #course select field
      select_tag 'material[course_id]', options_from_collection_for_select(Course.all, :id, :name)
    else
      #hidden field with course_id
      hidden_field_tag 'material[course_id]', material.course_id
    end
  end
end
