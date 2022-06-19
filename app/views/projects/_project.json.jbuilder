json.extract! project, :id, :name, :description, :isPrivate, :projectId, :created_at, :updated_at
json.url project_url(project, format: :json)
