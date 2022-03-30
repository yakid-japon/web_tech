# Démarrez le programme CGI pour recevoir et renvoyer des données
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンス（反応）を返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 受け取ったデータcgi['input']で取り出し、ローカル変数に代入する
  # 目印の'input'から情報を取り出す
  goyas = cgi['allGoya']
  #Return response in HTML
  "<html>
    <body>
      <p>受け取った文字列は下記になります</p>
      <p>文字列：#{goyas}</p>
    </body>
  </html>"
}