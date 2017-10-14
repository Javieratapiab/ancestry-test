class Management < ApplicationRecord
  has_ancestry
  validates_presence_of :area
  after_save :recalculate_grades

  def recalculate_grades
    if self.parent
      siblings_grades = self.siblings.collect(&:grade)
      self.parent.update(grade: siblings_grades.inject { |i,v| i+v }.to_f / siblings_grades.size)
    end
  end 
end
