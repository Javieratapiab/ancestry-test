class Management < ApplicationRecord
  has_ancestry
  validates_presence_of :area
  validates_numericality_of :grade, greater_than_or_equal_to: 0
  after_save :recalculate_grades

  def recalculate_grades
    if self.parent
      siblings_grades = self.siblings.collect(&:grade)
      average = siblings_grades.inject { |i,v| i+v }.to_f / siblings_grades.size
      self.parent.update(grade: average)
    end
  end 
end
