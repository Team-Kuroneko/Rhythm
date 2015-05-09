(function() {
  var IMG_CHARA0_PATH, IMG_CHARA1_PATH, IMG_ICON1_PATH, IMG_MAP0_PATH, IMG_MAP2_PATH, MAP_SIZE_X, MAP_SIZE_Y, game, gtime, init, main;

  enchant();

  IMG_CHARA0_PATH = './images/chara0.png';

  IMG_CHARA1_PATH = './images/chara1.png';

  IMG_ICON1_PATH = './images/icon1.png';

  IMG_MAP0_PATH = './images/map0.gif';

  IMG_MAP2_PATH = './images/map2.png';

  game = null;

  gtime = 0;

  MAP_SIZE_X = 20;

  MAP_SIZE_Y = 40;

  main = function() {
    var map, mapArray, player;
    game.rootScene.backgroundColor = "#000000";
    console.log('map');
    map = new Map(16, 16);
    map.image = game.assets[IMG_MAP0_PATH];
    mapArray = [
    [231,231,231,231,231,231,231,231,231,231,231,231,231,231,231,231,231,231,231,115],
    [215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,215,216,115],
    [103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,103,232,115],
    [119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,232,115],
    [95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,102,104,232,115],
    [97,81,81,81,97,97,97,97,97,97,97,97,97,97,97,97,102,104,232,115],
    [81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,102,104,232,115],
    [97,97,81,97,97,97,97,81,81,81,81,81,81,81,81,81,102,104,232,115],
    [97,97,81,81,81,81,81,81,97,97,97,97,97,97,97,97,102,104,232,115],
    [85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,102,104,232,115],
    [68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,68,102,104,232,115],
    [67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,102,104,232,115],
    [67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,67,102,104,232,115],
    [142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,142,102,104,232,115],
    [87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,103,104,232,115],
    [119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,119,120,232,115],
    [247,247,247,247,247,247,247,247,247,247,247,247,247,247,247,247,247,247,248,115],
    [95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,95,115],
    [81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,81,115],
    [101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101,101]
];
    map.loadData(mapArray);
    map.x = 0;
    map.y = (game.bs * 10) * -1;
    game.rootScene.addChild(map);
    player = new Sprite(game.bs * 2, game.bs * 2);
    player.image = game.assets[IMG_CHARA0_PATH];
    player.x = game.bs * 9;
    player.y = game.bs * 10;
    player.frame = 0;
    game.rootScene.addChild(player);
    player.addEventListener(Event.ENTER_FRAME, function() {
      player.frame = player.age % 3;
      if (game.input.up && map.y < player.y) {
        map.y += game.bs;
        console.log('map.x =' + map.x + ', map.y =' + map.y);
      }
      if (game.input.down && map.y > game.bs * -28) {
        map.y -= game.bs;
        console.log('map.x =' + map.x + ', map.y =' + map.y);
      }
      if (game.input.left && player.x > game.bs) {
        player.x -= game.bs;
        console.log('map.x =' + map.x + ', map.y =' + map.y);
      }
      if (game.input.right && player.x < game.bs * (MAP_SIZE_X - 3)) {
        player.x += game.bs;
        console.log('map.x =' + map.x + ', map.y =' + map.y);
      }
    });
    game.rootScene.addEventListener(Event.ENTER_FRAME, function() {
      gtime += 1;
      if (gtime % (game.fps / 2) === 0) {
        player.tl.moveBy(0, -5, 3).moveBy(0, 5, 3);
      }
    });
  };

  init = function() {
    game = new Core(320, 320);
    game.preload(IMG_CHARA0_PATH, IMG_CHARA1_PATH, IMG_ICON1_PATH, IMG_MAP0_PATH, IMG_MAP2_PATH);
    game.bs = 16;
    game.fps = 24;
    game.onload = main;
    game.start();
    gtime = 0;
  };

  window.onload = init;

}).call(this);
