# UpWork skills parser
Article: [Scrape UpWork skills with Nokogiri](http://max-si-m.github.io/scraping-upwork-skills/)

Just for fun, maybe it will be helpful for someone :smile:

## Usage

Very simple:

```ruby
skill_parser = Parsers::UpWork::SkillsParser.new('a'..'z')
skill_parser.scrape_pages
skill_parser.data #=> Array[..]
```

## Contributing

1. Fork it ( https://github.com/WScraping/up_work_skills )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
