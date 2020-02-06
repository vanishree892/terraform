resource "heroku_app" "web" {}

# Create our DNSimple record to point to the
# heroku application.
resource "dnsimple_record" "web" {
  domain = "test123.com"

  name = "terraform"

  # heroku_hostname is a computed attribute on the heroku
  # application we can use to determine the hostname
  value = "${heroku_app.web.heroku_hostname}"

  type = "CNAME"
  ttl  = 3600
}

# The Heroku domain, which will be created and added
# to the heroku application after we have assigned the domain
# in DNSimple
resource "heroku_domain" "foobar" {
  app      = "test123"
  hostname = "1.1.1.1"
}
