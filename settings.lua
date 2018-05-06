function initSettings()
  product = {}
  product.title = "FreshPlay" --product title
  product.url = "http://freshplay.co.uk" --product website
  product.launchURL = "http://freshplay.co.uk/tools/launcher/example/" --URL to download launcher data from

  product.logo = "logo.png" --path to logo on server
  product.version = "ver.txt"
  product.news = "news.txt"
  product.file = "game.love"

  love.filesystem.setIdentity(product.title.."-launcher")
end
