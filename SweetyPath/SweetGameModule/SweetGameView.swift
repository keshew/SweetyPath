import SwiftUI
import SpriteKit

enum Direction {
    case up, down, left, right
}

class SweetGameData: ObservableObject {
    @Published var isPause = false
    @Published var isWin = false
    @Published var isLose = false
    @Published var isRules = false
    @Published var timeLeft = 60
    @Published var scene = SKScene()
    
}

class ColorBlock: SKSpriteNode {
    let colorValue: Int?
    var currentValue: Int? {
        didSet {
            updateLabel()
        }
    }
    var isStartable: Bool
    var isLinePassable: Bool
    var hasLine: Bool = false
    private var labelNode: SKLabelNode?
    private var imageNode: SKSpriteNode?

    init(color: UIColor, value: Int?, size: CGSize, isStartable: Bool, isLinePassable: Bool = true, imageName: String? = nil) {
        self.colorValue = value
        self.currentValue = value
        self.isStartable = isStartable
        self.isLinePassable = isLinePassable
        super.init(texture: nil, color: color, size: size)

        addOutline(size: size)

        if let value = value {
            labelNode = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
            labelNode?.text = "\(value)"
            labelNode?.zPosition = 3 
            labelNode?.fontSize = 23
            labelNode?.fontColor = .white
            labelNode?.position = CGPoint(x: 0, y: -10)
            addChild(labelNode!)
        }

        if let imageName = imageName {
            imageNode = SKSpriteNode(imageNamed: imageName)
            imageNode?.size = CGSize(width: 73, height: 73)
            imageNode?.position = CGPoint(x: 0, y: 0) 
            addChild(imageNode!)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func resizeImage(newSize: CGSize) {
        imageNode?.size = newSize
    }

    private func updateLabel() {
        guard let currentValue = currentValue else { return }
        labelNode?.text = "\(currentValue)"
    }

    private func addOutline(size: CGSize) {
        let outline = SKShapeNode(rectOf: size)
        outline.strokeColor = .white
        outline.lineWidth = 1
        outline.zPosition = 1
        addChild(outline)
    }
}



class SweetGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: SweetGameData?
    @ObservedObject var audioManager = AudioManager.shared
    var timeLabel: SKLabelNode!
    var colorBlocks: [ColorBlock] = []
    var lines: [SKShapeNode] = []
    var currentLinePath: CGMutablePath?
    var currentColor: UIColor?
    var startBlock: ColorBlock?
    var currentDirection: Direction?
    var timer: Timer!
    var  bonusCountLabel: SKLabelNode!
    let level: Int
    
    init(level: Int) {
        self.level = level
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        createMainObject()
        createTappedObject()
    }

    func createMainObject() {
        let gameBackground = SKSpriteNode(imageNamed: UserDefaultsManager().getSelectedPotImage() ?? SweetImageName.mainBackground.rawValue)
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)

        let topLine = SKSpriteNode(imageNamed: SweetImageName.shadowTop.rawValue)
        topLine.size = CGSize(width: size.width, height: size.height * 0.3)
        topLine.position = CGPoint(x: size.width / 2, y: size.height / 1.15)
        addChild(topLine)

        let bottomLine = SKSpriteNode(imageNamed: SweetImageName.shadowToBack.rawValue)
        bottomLine.size = CGSize(width: size.width, height: size.height * 0.3)
        bottomLine.position = CGPoint(x: size.width / 2, y: size.height / 11)
        addChild(bottomLine)

        let moneyBack = SKSpriteNode(imageNamed: SweetImageName.smallBackButton.rawValue)
        moneyBack.size = CGSize(width: size.width * 0.352, height: size.height * 0.067)
        moneyBack.position = CGPoint(x: size.width / 1.3  , y: size.height / 1.13)
        addChild(moneyBack)

        let money = SKSpriteNode(imageNamed: SweetImageName.money.rawValue)
        money.size = CGSize(width: size.width * 0.136, height: size.width * 0.136)
        money.position = CGPoint(x: size.width / 1.56  , y: size.height / 1.13)
        addChild(money)

        let moneyLabel = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
        moneyLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 23)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        moneyLabel.position = CGPoint(x: size.width / 1.24, y: size.height / 1.15)
        addChild(moneyLabel)

        let lifesBack = SKSpriteNode(imageNamed: SweetImageName.smallBackButton.rawValue)
        lifesBack.size = CGSize(width: size.width * 0.35, height: size.height * 0.067)
        lifesBack.position = CGPoint(x: size.width / 1.3  , y: size.height / 1.25)
        addChild(lifesBack)

        let heart = SKSpriteNode(imageNamed: SweetImageName.heart.rawValue)
        heart.size = CGSize(width: size.width * 0.164, height: size.width * 0.164)
        heart.position = CGPoint(x: size.width / 1.56  , y: size.height / 1.25)
        addChild(heart)

        let lifesLabel = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
        lifesLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 23)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        lifesLabel.position = CGPoint(x: size.width / 1.24, y: size.height / 1.275)
        addChild(lifesLabel)

        let timeBack = SKSpriteNode(imageNamed: SweetImageName.smallBackButton.rawValue)
        timeBack.size = CGSize(width: size.width * 0.35, height: size.height * 0.067)
        timeBack.position = CGPoint(x: size.width / 2  , y: size.height / 1.43)
        addChild(timeBack)

        let time = SKSpriteNode(imageNamed: SweetImageName.timeImage.rawValue)
        time.size = CGSize(width: size.width * 0.164, height: size.width * 0.164)
        time.position = CGPoint(x: size.width / 2.6  , y: size.height / 1.415)
        addChild(time)

        timeLabel = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
        timeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft/60):\(game!.timeLeft % 60)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 23)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        timeLabel.position = CGPoint(x: size.width / 1.83, y: size.height / 1.46)
        addChild(timeLabel)

        let board = SKSpriteNode(imageNamed: SweetImageName.detailRecipe.rawValue)
        board.size = CGSize(width: size.width * 0.932, height: size.height * 0.478)
        board.position = CGPoint(x: size.width / 2  , y: size.height / 2.3)
        addChild(board)

        let levelLabel = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
        levelLabel.attributedText = NSAttributedString(string: "LEVEL \(level)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 35)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        levelLabel.position = CGPoint(x: size.width / 2, y: size.height / 7)
        addChild(levelLabel)
    }

    func createTappedObject() {
        let menu = SKSpriteNode(imageNamed: SweetImageName.menu.rawValue)
        menu.size = CGSize(width: size.width * 0.16, height: size.height * 0.091)
        menu.position = CGPoint(x: size.width / 8, y: size.height / 1.13)
        menu.name = "menu"
        addChild(menu)

        let rules = SKSpriteNode(imageNamed: SweetImageName.rules.rawValue)
        rules.name = "rules"
        rules.size = CGSize(width: size.width * 0.16, height: size.height * 0.091)
        rules.position = CGPoint(x: size.width / 8, y: size.height / 1.27)
        addChild(rules)

        let bonusBack = SKSpriteNode(imageNamed: SweetImageName.backBonus.rawValue)
        bonusBack.name = "bonusBack"
        bonusBack.size = CGSize(width: size.width * 0.2, height: size.height * 0.091)
        bonusBack.position = CGPoint(x: size.width / 2  , y: size.height / 12)
        addChild(bonusBack)

        let bonus = SKSpriteNode(imageNamed: SweetImageName.upgrade.rawValue)
        bonus.name = "bonus"
        bonus.size = CGSize(width: size.width * 0.118, height: size.height * 0.054)
        bonus.position = CGPoint(x: size.width / 2  , y: size.height / 12)
        addChild(bonus)
        
        let bonusCountBack = SKSpriteNode(imageNamed: SweetImageName.backCountBonus.rawValue)
        bonusCountBack.name = "bonusCountBack"
        bonusCountBack.size = CGSize(width: size.width * 0.102, height: size.height * 0.049)
        bonusCountBack.position = CGPoint(x: size.width / 1.6  , y: size.height / 15.66)
        addChild(bonusCountBack)

        bonusCountLabel = SKLabelNode(fontNamed: "BowlbyOneSC-Regular")
        bonusCountLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 0)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        bonusCountLabel.position = CGPoint(x: size.width / 1.6, y: size.height / 21.5)
        addChild(bonusCountLabel)
    }

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size = UIScreen.main.bounds.size
        setupView()
        setupColorBlocks()
        startTimer()
    }
    
    func tapOnMenu(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "menu" {
            game!.isPause = true
            game!.scene = scene!
            scene?.isPaused = true
        }
    }
    
    func tapOnRules(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "rules" {
            game!.isRules = true
            game!.scene = scene!
            scene?.isPaused = true
        }
    }
    
    func tapOnBonus(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "bonusCountBack" || tappedNode.name == "bonus" || tappedNode.name == "bonusBack" {
            audioManager.playBonusMusic()
            if UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 0 > 0 {
                let countTime = UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 0
                UserDefaultsManager.defaults.set(countTime - 1, forKey: Keys.timeCount.rawValue)
                game?.timeLeft += 30
                timeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft/60):\(game!.timeLeft % 60)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 23)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -6
                ])
                
                bonusCountLabel.attributedText = NSAttributedString(string: "\(UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 0)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 20)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -6
                ])
            }
        }
    }

    func removeLineAndResetBlocks(line: SKShapeNode) {
        line.removeFromParent()
        lines.removeAll { $0 == line }
        if let blocks = line.userData?["blocks"] as? [ColorBlock] {
            for block in blocks {
                block.hasLine = false
                if block.isStartable, let value = block.currentValue {
                    block.currentValue = value + 1
                }
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.game!.isRules == false, self.game!.isPause == false {
                self.updateTimer()
            }
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0{
                game?.timeLeft -= 1
            timeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft/60):\(game!.timeLeft % 60)", attributes: [
                NSAttributedString.Key.font: UIFont(name: "BowlbyOneSC-Regular", size: 23)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor(red: 250/255, green: 40/255, blue: 85/255, alpha: 1),
                NSAttributedString.Key.strokeWidth: -6
            ])
            } else {
                if game!.isWin != true {
                    game?.isLose = true
                    scene?.isPaused = true
                    timer?.invalidate()
                    UserDefaultsManager().loseLevel()
                }
            }
        }
    
    func checkForVictory() {
        let allBlocksZero = colorBlocks.filter { $0.currentValue != nil }.allSatisfy { $0.currentValue == 0 }

        if allBlocksZero {
            game?.isWin = true
            timer.invalidate()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           guard let touch = touches.first else { return }
           let location = touch.location(in: self)
        tapOnMenu(touchLocation: location)
        tapOnRules(touchLocation: location)
        tapOnBonus(touchLocation: location)
           let nodes = nodes(at: location)
           for node in nodes {
               if node.name == "line", let lineNode = node as? SKShapeNode {
                   removeLineAndResetBlocks(line: lineNode)
                   return
               }
           }

           for block in colorBlocks {
               if block.contains(location) && block.isStartable {
                   startBlock = block
                   currentColor = block.color
                   currentLinePath = CGMutablePath()
                   currentLinePath!.move(to: block.position)
                   currentDirection = nil
                   return
               }
           }
       }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let currentLinePath = currentLinePath, let startBlock = startBlock else { return }
        let location = touch.location(in: self)
        
        if currentDirection == nil {
            let dx = location.x - startBlock.position.x
            let dy = location.y - startBlock.position.y
            
            if abs(dx) > abs(dy) {
                currentDirection = (dx > 0) ? .right : .left
            } else {
                currentDirection = (dy > 0) ? .up : .down
            }
        }
        
        if let value = startBlock.currentValue, value <= 0 {
            touchesEnded(touches, with: event)
            return
        }
        
        for block in colorBlocks {
            if block.contains(location) && block != startBlock && !block.hasLine && block.isLinePassable {
                switch currentDirection {
                case .up:
                    if block.position.x != startBlock.position.x || block.position.y <= startBlock.position.y { continue }
                case .down:
                    if block.position.x != startBlock.position.x || block.position.y >= startBlock.position.y { continue }
                case .left:
                    if block.position.y != startBlock.position.y || block.position.x >= startBlock.position.x { continue }
                case .right:
                    if block.position.y != startBlock.position.y || block.position.x <= startBlock.position.x { continue }
                default:
                    break
                }
                
                if !block.isLinePassable {
                    touchesEnded(touches, with: event)
                    return
                }
                if block.hasLine {
                    touchesEnded(touches, with: event)
                    return
                }
                
                if block.currentValue != nil {
                    continue
                }
                
                currentLinePath.addLine(to: block.position)
                let lineNode = SKShapeNode(path: currentLinePath)
                lineNode.strokeColor = currentColor ?? .black
                lineNode.lineWidth = 15
                lineNode.name = "line"
                lineNode.lineCap = .round
                if lineNode.userData == nil {
                    lineNode.userData = NSMutableDictionary()
                    lineNode.userData?["blocks"] = [startBlock]
                }
                var blocks = lineNode.userData?["blocks"] as! [ColorBlock]
                blocks.append(block)
                lineNode.userData?["blocks"] = blocks
                
                addChild(lineNode)
                lines.append(lineNode)
                block.hasLine = true
                
                if let value = startBlock.currentValue, value > 0 {
                    startBlock.currentValue! -= 1
                    
                    checkForVictory()
                }
                startBlock.hasLine = true
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLinePath = nil
        currentColor = nil
        startBlock = nil
        currentDirection = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
           currentLinePath = nil
           currentColor = nil
           startBlock = nil
           currentDirection = nil
       }
}

struct SweetGameView: View {
    @StateObject var sweetGameModel =  SweetGameViewModel()
    @StateObject var gameModel = SweetGameData()
    var level: Int
    var body: some View {
        ZStack {
            SpriteView(scene: sweetGameModel.createSweetGameScene(gameData: gameModel, level: level))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            if gameModel.isPause {
                SweetPauseView(game: gameModel, scene: gameModel.scene)
            }
            
            if gameModel.isRules {
                SweetRulesView(game: gameModel, scene: gameModel.scene)
            }
            
            if gameModel.isWin {
                SweetWinView(level: level)
            }
            
            if gameModel.isLose {
                SweetLoseView(level: level)
            }
        }
    }
}

#Preview {
    SweetGameView(level: 1)
}

extension SKShapeNode {
    private struct AssociatedKeys {
        static var blocksKey: UInt8 = 0
    }

    var blocks: [ColorBlock] {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.blocksKey) as? [ColorBlock] ?? []
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.blocksKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
