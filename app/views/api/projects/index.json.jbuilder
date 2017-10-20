@projects.each do |project|
  json.set! project.id do
    json.partial! 'project', project: project
  end
end

# json.allIds Project.ids
