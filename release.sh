rm -rf release
mkdir -p release/html/game
godot --export "HTML5" $(pwd)/release/html/index.html
zip -r release/game.zip release/html
butler push release/game.zip Dexterminator/game:html
