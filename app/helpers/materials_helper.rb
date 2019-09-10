module MaterialsHelper
  def course_id_field(material)
    if material.course.nil?
      select_tag 'material[course_id]', options_from_collection_for_select(Course.all, :id, :name)
    else
      hidden_field_tag 'material[course_id]', material.course_id
    end
  end

  def correct_new_material_path
    if params[:course_id]
      return new_course_material_path
    else
      return new_material_path
    end
  end
end
