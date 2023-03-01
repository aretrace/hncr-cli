require "opts"
require "crayon"
require "hncr"

module HNCLI
  class Main
    include Opts

    VERSION = "0.1.1"
    PROGRAM = "hncr"

    option item    : String, "-i TYPE", "--item=TYPE", "The type of item", "best"
    option count   : Int32, "-c NUMBER", "--count=NUMBER", "The number of stories", 5
    option help    : Bool, "-h", "--help", "Show this help", false
    option version : Bool, "-v", "--version", "Print the version and exit", false

    def run
      crayon = Crayon::Text.new
      arr = [] of String
      HN::Item.new(type: item, count: count) do |item|
        header = crayon.bold("#{item["title"]} - #{item["by"]}")
        url = crayon.italic("#{item["url"]?} |")
        time = Time.unix(item["time"].as_i).to_s("%Y-%m-%d %r")
        body = item["url"]? ? "#{url} #{time}" : "#{time}"
        arr << "[#{item["score"]}] #{header}" << body << ""
      end
      puts Crayon::Box.new(arr).set_border_style(Crayon::Box::Style::Rounded).set_padding(1, 1).set_title("Hacker News").render
    end
  end
end

HNCLI::Main.run
