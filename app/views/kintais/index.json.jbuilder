json.array!(@kintais) do |kintai|
  json.extract! kintai, :id, :employee_id, :name, :shusha, :taisha
  json.url kintai_url(kintai, format: :json)
end
