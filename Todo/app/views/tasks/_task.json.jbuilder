json.extract! task, :id, :title, :description, :due_date, :priority, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)
