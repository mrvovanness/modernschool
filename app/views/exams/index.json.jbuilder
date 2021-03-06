json.array! @exams do |exam|
  json.extract! exam, :id, :title, :description
  json.start exam.date
  json.end exam.date + 2.hours
  json.url exam_path(exam, format: :html)
end
