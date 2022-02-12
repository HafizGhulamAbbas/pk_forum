json.extract! job, :id, :user_id, :province, :department, :district, :opendate, :closedate, :url, :qualification, :salary, :eligibility, :description, :created_at, :updated_at
json.url job_url(job, format: :json)
