require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'acceuil.html.erb')
server.mount('/validation.cgi', WEBrick::HTTPServlet::CGIHandler, 'validation.rb')
server.mount('/goyaM.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyaM.rb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')


server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
# この一行を追記
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.start

