module AssignmentsHelper
  def display_viewed_or_not(assignment)
    !assignment.viewed ? 'inline-block' : 'none'
  end
end
