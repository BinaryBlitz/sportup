json.array! @reports do |report|
  json.partial! 'api/reports/report', report: report

  json.user do
    json.partial! 'api/users/user', user: report.reported_user
  end
end
