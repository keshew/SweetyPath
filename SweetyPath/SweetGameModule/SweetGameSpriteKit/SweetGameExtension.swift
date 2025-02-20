import SwiftUI
import SpriteKit

extension SweetGameSpriteKit {
    func setupColorBlocks() {
        var gridRows = 4
        var gridColumns = 4
        
        switch UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1 {
        case 1:
            gridRows = 4
            gridColumns = 4
            let blockSize = CGSize(width: 73, height: 73)
            let spacing: CGFloat = 10.0

            let startableColors = [UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1)]
            let startableValues = [2, 3, 2]

            let nonStartableColors = [UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.67 - gridWidth / 2
            let startY = size.height / 2.1 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 0 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 3 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 10 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 2:
            gridRows = 5
            gridColumns = 5
            let blockSize = CGSize(width: 58, height: 58)
            let spacing: CGFloat = 10.0

            let startableColors = [UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1)]
            let startableValues = [2, 5, 1, 5]

            let nonStartableColors = [UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.75 - gridWidth / 2
            let startY = size.height / 2.15 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 2 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 11 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 15 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 24 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
        case 3:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0

            let startableColors =  [UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                    UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                    UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1)]
            let startableValues = [3, 5, 4, 3, 3]

            let nonStartableColors = [UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 1 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 17 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 20 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 25 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 33 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 4:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0

            let startableColors =  [UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                    UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                    UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                    UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1)
            ]
            let startableValues = [4, 2, 3, 4, 3, 3]

            let nonStartableColors = [UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 2 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 13 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 21 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 23 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 28 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 30 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 5:
            gridRows = 5
            gridColumns = 5
            let blockSize = CGSize(width: 58, height: 58)
            let spacing: CGFloat = 10.0

            let startableColors = [UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1)
                                   ]
            let startableValues = [1, 1, 3, 2, 4, 3]

            let nonStartableColors = [UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.75 - gridWidth / 2
            let startY = size.height / 2.15 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 2 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 8 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 11 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 17 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 20 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 24 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 6:
            gridRows = 5
            gridColumns = 5
            let blockSize = CGSize(width: 58, height: 58)
            let spacing: CGFloat = 10.0

            let startableColors = [UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1)
                                   ]
            let startableValues = [6, 2, 2, 4, 1, 1]

            let nonStartableColors = [UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.75 - gridWidth / 2
            let startY = size.height / 2.15 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 0 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 6 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 9 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 18 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 22 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 23 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 7:
            gridRows = 5
            gridColumns = 5
            let blockSize = CGSize(width: 58, height: 58)
            let spacing: CGFloat = 10.0

            let startableColors = [UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1)]
            let startableValues = [4, 4, 1, 4, 2]

            let nonStartableColors = [UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.75 - gridWidth / 2
            let startY = size.height / 2.15 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 3 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 5 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 12 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 19 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 22 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 8:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0
            
            let startableColors = [UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 218/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1)
            ]
            let startableValues = [4, 1, 5, 3, 3, 1, 4]
            
            let nonStartableColors = [UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 0 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 4 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 9 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 18 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 20 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 31 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 35 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 9:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0
            
            let startableColors = [UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 218/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   
                                   UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1)
            ]
            let startableValues = [4, 1, 6, 3, 1, 3, 2]
            
            let nonStartableColors = [ UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 6 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 11 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 14 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 16 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 25 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 27 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 35 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 10:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0
            
            let startableColors = [UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 218/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1)]
            let startableValues = [1, 1, 2, 10, 4, 3, 1]
            
            let nonStartableColors = [UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 1 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 3 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 11 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 14 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 29 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 30 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 33 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 11:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0
            
            let startableColors = [UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1),
                                   UIColor(red: 218/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1)]
            let startableValues = [4, 4, 4, 3, 8]
            
            let nonStartableColors = [ UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 1 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 10 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 25 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 29 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 30 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
            
        case 12:
            gridRows = 6
            gridColumns = 6
            let blockSize = CGSize(width: 48, height: 49)
            let spacing: CGFloat = 10.0
            
            let startableColors = [UIColor(red: 105/255, green: 1/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 51/255, green: 26/255, blue: 25/255, alpha: 1),
                                   UIColor(red: 218/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 211/255, green: 34/255, blue: 148/255, alpha: 1),
                                   UIColor(red: 28/255, green: 111/255, blue: 73/255, alpha: 1),
                                   UIColor(red: 158/255, green: 72/255, blue: 4/255, alpha: 1),
                                   UIColor(red: 166/255, green: 167/255, blue: 171/255, alpha: 1)]
            let startableValues = [3, 2, 3, 1, 6, 10, 3]
            
            let nonStartableColors = [ UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
            
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                      UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1),
                                       UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1),
                                      ]

            let gridWidth = CGFloat(gridColumns) * blockSize.width + CGFloat(gridColumns - 1) * spacing
            let gridHeight = CGFloat(gridRows) * blockSize.height + CGFloat(gridRows - 1) * spacing
            let startX = size.width / 1.78 - gridWidth / 2
            let startY = size.height / 2.17 - gridHeight / 2

            var startableIndex = 0
            for row in 0..<gridRows {
                for col in 0..<gridColumns {
                    let index = row * gridColumns + col
                    let block: ColorBlock
                    
                    if index == 0 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 3 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 5 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 13 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 20 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else if index == 28 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    }  else if index == 32 {
                        let color = startableColors[startableIndex]
                        let value = startableValues[startableIndex]
                        block = ColorBlock(color: color, value: value, size: blockSize, isStartable: true, isLinePassable: true)
                        block.zPosition = 10
                        startableIndex += 1
                        
                    } else {
                        let color = nonStartableColors[index]
                        let isBlack = color == UIColor(red: 179/255, green: 119/255, blue: 219/255, alpha: 1)
                        block = ColorBlock(color: color, value: nil, size: blockSize, isStartable: false, isLinePassable: !isBlack)
                    }

                    let xPosition = startX + CGFloat(col) * (blockSize.width + spacing)
                    let yPosition = startY + CGFloat(gridRows - 1 - row) * (blockSize.height + spacing)
                    block.position = CGPoint(x: xPosition, y: yPosition)

                    addChild(block)
                    colorBlocks.append(block)
                }
            }
        default:
            _ = 0
        }
        
    }
    
    
}
