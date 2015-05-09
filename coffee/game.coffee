#   cfcoptions : { "out": "../js/"   }
enchant()

IMG_CHARA0_PATH = './images/chara0.png'
IMG_CHARA1_PATH = './images/chara1.png'
IMG_ICON1_PATH = './images/icon1.png'
IMG_MAP0_PATH = './images/map0.png'
IMG_MAP2_PATH = './images/map2.png'
game = null
gtime = 0
MAP_SIZE_X = 20
MAP_SIZE_Y = 40

# ロードが完了した直後に実行される関数。
main = -> 
    game.rootScene.backgroundColor = "#000000"
    
    console.log('map')

    map = new Map(16, 16)
    map.image = game.assets[IMG_MAP0_PATH]
    mapArray = [
        [ 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 4 ],
        [ 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4 ]
    ]
    map.loadData mapArray
    map.x = 0
    map.y = (game.bs * 10) * -1
    game.rootScene.addChild map
    
    player = new Sprite(game.bs * 2, game.bs * 2)
    player.image = game.assets[IMG_CHARA0_PATH]
    player.x = game.bs * 9
    player.y = game.bs * 10
    player.frame = 0
    
    game.rootScene.addChild player
    
    player.addEventListener Event.ENTER_FRAME, ->
        player.frame = player.age % 3
        if game.input.up and map.y < player.y
            map.y += game.bs
            console.log('map.x =' + map.x + ', map.y =' + map.y)
        if game.input.down and map.y > game.bs * -28
            map.y -= game.bs
            console.log('map.x =' + map.x + ', map.y =' + map.y)
        if game.input.left and player.x > game.bs
            player.x -= game.bs
            console.log('map.x =' + map.x + ', map.y =' + map.y)
        if game.input.right and player.x < game.bs * (MAP_SIZE_X - 3)
            player.x += game.bs
            console.log('map.x =' + map.x + ', map.y =' + map.y)
        
        return 
    
    game.rootScene.addEventListener Event.ENTER_FRAME, ->
        gtime += 1
        
        if gtime % (game.fps / 2) is 0
            player.tl.moveBy(0, -5, 3).moveBy(0, 5, 3)

        return
    
    return





init = ->
    game = new Core(320, 320)
    # 素材をプリロードする
    game.preload IMG_CHARA0_PATH ,IMG_CHARA1_PATH ,IMG_ICON1_PATH ,IMG_MAP0_PATH ,IMG_MAP2_PATH
    game.bs = 16
    game.fps = 24
    game.onload = main
    # ゲームを開始する。
    game.start()
    gtime = 0
    return 

window.onload = init
