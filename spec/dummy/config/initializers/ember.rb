EmberCli.configure do |c|
  c.app "my-app", yarn: ENV.fetch("CI", false)
end
