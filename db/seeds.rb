# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

url = "https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_ke 'original_title';y%3E"
url_serialized = URI.open("#{url}?page=1").read
movies = JSON.parse(url_serialized)

movies['results'].each do |movie|
  base_poster_url = "https://image.tmdb.org/t/p/original"
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "#{base_poster_url}/#{movie['backdrop_path']}"
  )
end
