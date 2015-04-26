json.array!(@region_compensations) do |region_compensation|
  json.extract! region_compensation, :id, :region_name, :country_name, :state, :number_of_employees, :salary_total
  json.url region_compensation_url(region_compensation, format: :json)
end
