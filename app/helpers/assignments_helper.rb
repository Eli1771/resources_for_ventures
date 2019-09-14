module AssignmentsHelper
  def display_viewed_or_not(assignment)
    !assignment.viewed ? 'inline-block' : 'none'
  end

  def viewed_or_not(assignment)
    !assignment.viewed ? 'Not Viewed' : 'Viewed'
  end
end
