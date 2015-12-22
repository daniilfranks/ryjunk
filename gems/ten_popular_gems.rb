require 'octokit'
 
# Query the API
repos = Octokit.search_repos "language:ruby", sort: "stars", order: "desc", per_page: 10
 
# Print the names
puts repos.items.map(&:name)
 
# Get the next 10
repos = Octokit.search_repos "language:ruby",
                sort: "stars", order: "desc", per_page: 10, page: 2

puts repos.items.map(&:name)
