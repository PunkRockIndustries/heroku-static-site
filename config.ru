$stdout.sync = true

use Rack::Static,
  :urls => [ "/assets/bootstrap", "/assets/css", "/assets/fonts", "/assets/images", "/assets/js", "/assets/php"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}

