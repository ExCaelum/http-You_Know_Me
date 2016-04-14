require './lib/request_parser.rb'

class Response

  def initialize
    words = File.readlines("/usr/share/dict/words")
    @valid_words = words.map {|word| word.chomp}
  end

  def output(request, client = nil, counter = 0)
    if request.path == "/"
       "Verb: #{request.verb}\nPath: #{request.path}\nProtocol: #{request.protocol}\nHost: #{request.headers.fetch("Host")[0..-6]}\nPort: #{request.headers.fetch("Host")[-4..-1]}\nOrigin: #{request.headers.fetch("Host")[0..-6]}\nAccept: #{request.headers.fetch("Accept")}"
    elsif request.path == "/hello"
       "Hello World! #{counter}"
    elsif request.path == "/datetime"
      date = Time.now.strftime('%l:%M %p on %A, %B %e, %Y')
       "#{date}"
    elsif request.path == "/shutdown"
       "Total Request: #{counter}"
    elsif request.path.split("?")[0] == "/word_search"
      word = request.path.split('?')[1].split('=')[1]
       if @valid_words.include?(word)
         "#{word.upcase} is a known word"
       else
         "#{word.upcase} is not a known word"
       end
    end
  end
end




# case request.path
# when "/"
#   "Verb: #{request.verb}\nPath: #{request.path}\nProtocol: #{request.protocol}\nHost: #{request.headers.fetch("Host")[0..-6]}\nPort: #{request.headers.fetch("Host")[-4..-1]}\nOrigin: #{request.headers.fetch("Host")[0..-6]}\nAccept: #{request.headers.fetch("Accept")}"
# when "/hello"
#   "Hello World! #{counter}"
# when "/datetime"
#   date = Time.now.strftime('%l:%M %p on %A, %B %e, %Y')
#   "#{date}"
# when "/word_search"
#
# when "/shutdown"
#   "Total Request: #{counter}"
# end
