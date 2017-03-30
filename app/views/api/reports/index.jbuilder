json.array! @reports do |report|
  json.partial! 'api/reports/report', report: report

  json.user do
    json.partial! 'api/users/user', user: report.reported_user

    json.violations_count report.reported_user.reports.where(event: report.event).violated.count
  end
end
