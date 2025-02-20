import SwiftUI

enum Keys: String {
    case lifes = "lifes"
    case currentLevel = "currentLevel"
    case backgroundVolume = "backgroundVolume"
    case money = "money"
    case timeCount = "timeCount"
    case firstItems = "firstItems"
    case collectionItem = "collectionItem"
    case soundEffectVolume = "soundEffectVolume"
    case shopItems = "shopItems"
}

class UserDefaultsManager: ObservableObject {
    static let defaults = UserDefaults.standard
    @Published var collectionItem: [Recipe] = []
    @Published var images: [String] = []
    @Published var shopItems = [ShopItemModel(text: "CASTLE", image: SweetImageName.bg1.rawValue, bgImage: SweetImageName.castleBG.rawValue, isSelected: false, isAvailible: false),
                                ShopItemModel(text: "ROAD", image: SweetImageName.bg2.rawValue ,bgImage: SweetImageName.roadBG.rawValue, isSelected: false, isAvailible: false),
                                    ShopItemModel(text: "VILLAGE", image: SweetImageName.bg3.rawValue, bgImage: SweetImageName.villageBG.rawValue, isSelected: false, isAvailible: false),
                                    ShopItemModel(text: "HOUSE", image: SweetImageName.bg4.rawValue, bgImage: SweetImageName.houseBG.rawValue, isSelected: false, isAvailible: false)]
    init() {
        loadCollectionItems()
        firstLaunch()
        
        if let savedItems = loadShoItems() {
            self.shopItems = savedItems
        }
    }
    
    func loadShoItems() -> [ShopItemModel]? {
        if let savedItemsData = UserDefaultsManager.defaults.data(forKey: Keys.shopItems.rawValue) {
            let decoder = JSONDecoder()
            if let loadedShopItems = try? decoder.decode([ShopItemModel].self, from: savedItemsData) {
                return loadedShopItems
            }
        }
        return nil
    }
    
    func saveShopItems(array: [ShopItemModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.shopItems.rawValue)
        }
    }
    
    func saveShopItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(shopItems) {
            UserDefaultsManager.defaults.set(encoded, forKey: Keys.shopItems.rawValue)
        }
    }
    
    func getSelectedPotImage() -> String? {
        for shopItem in shopItems {
            if shopItem.isSelected {
                return shopItem.bgImage
            }
        }
        return nil
    }
    
    func manageShopItem(at index: Int) {
        guard index >= 0 && index < shopItems.count else { return }
        
        var selectedItem = shopItems[index]
        
        if selectedItem.isSelected {
            return
        }
        
        if selectedItem.isAvailible {
            for i in 0..<shopItems.count {
                if shopItems[i].isSelected {
                    shopItems[i].isSelected = false
                    shopItems[i].isAvailible = true
                    break
                }
            }
            
            selectedItem.isSelected = true
            selectedItem.isAvailible = false
            
        } else {
            let countOfMoney = UserDefaultsManager.defaults.integer(forKey: Keys.money.rawValue)
            if countOfMoney >= 30 {
                selectedItem.isAvailible = true
                
                for i in 0..<shopItems.count {
                    if shopItems[i].isSelected {
                        shopItems[i].isSelected = false
                        shopItems[i].isAvailible = true
                        break
                    }
                }
                
                selectedItem.isSelected = true
                selectedItem.isAvailible = false
                
                UserDefaultsManager.defaults.set(countOfMoney - 30, forKey: Keys.money.rawValue)
            }
        }
        
        shopItems[index] = selectedItem
        saveShopItems()
    }

    private func defaultRecipes() -> [Recipe] {
        return [Recipe(image: SweetImageName.recipe1.rawValue,
                       name: "Golden Harvest Crumble",
                       closeImage: SweetImageName.locked1.rawValue,
                       isOpen: false,
                       desc: "Slice fresh peaches and mix with sugar and a touch of cinnamon. Place the peaches in a baking dish. Prepare a simple biscuit dough with flour, baking powder, sugar, milk, and butter. Drop spoonfuls of the dough over the peaches and bake at 375°F (190°C) until the topping is golden and the fruit is bubbling. Serve warm with a scoop of vanilla ice cream."),
                Recipe(image: SweetImageName.recipe2.rawValue,
                       name: "Tangy Sunshine Tart",
                       closeImage: SweetImageName.locked2.rawValue,
                       isOpen: false,
                       desc: "Mix key lime juice, sweetened condensed milk, and egg yolks until smooth. Pour this mixture into a graham cracker crust and bake at 350°F (175°C) until set. Allow the pie to cool, then refrigerate. Serve chilled with whipped cream for a tangy, refreshing dessert."),
                Recipe(image: SweetImageName.recipe3.rawValue,
                       name: "Ruby Frost Delight",
                       closeImage: SweetImageName.locked3.rawValue,
                       isOpen: false,
                       desc: "Blend fresh raspberries with sugar and a bit of lemon juice. Strain the mixture to remove seeds, then churn in an ice cream maker until smooth and frozen. Serve this fruity sorbet as a light and refreshing dessert option."),
                Recipe(image: SweetImageName.recipe4.rawValue,
                       name: "Summer Stone Bake",
                       closeImage: SweetImageName.locked4.rawValue,
                       isOpen: false,
                       desc: "Arrange pitted cherries in a baking dish. Blend eggs, sugar, flour, and milk to create a batter, then pour it over the cherries. Bake at 375°F (190°C) until the clafoutis is puffed and golden. Dust with powdered sugar before serving."),
                Recipe(image: SweetImageName.recipe5.rawValue,
                       name: "Autumn Spice Treats",
                       closeImage: SweetImageName.locked5.rawValue,
                       isOpen: false,
                       desc: "Core apples and fill the centers with a mixture of oats, brown sugar, cinnamon, and butter. Place the apples in a baking dish\nwith a bit of water and bake\nat 350°F (175°C) until tender. Serve warm with a dollop of whipped cream."),
                Recipe(image: SweetImageName.recipe6.rawValue,
                       name: "Cloudberry Nest",
                       closeImage: SweetImageName.locked6.rawValue,
                       isOpen: false,
                       desc: "Whip egg whites with sugar until stiff peaks form, then shape into a nest on a baking sheet. Bake at a low temperature until dry and crisp. Top with whipped cream and fresh fruit like kiwi and strawberries before serving."),
                Recipe(image: SweetImageName.recipe7.rawValue,
                       name: "Creamy Comfort Bowl",
                       closeImage: SweetImageName.locked7.rawValue,
                       isOpen: false,
                       desc: "Cook rice in milk with sugar, vanilla, and a pinch of salt until creamy. Stir in eggs and continue cooking until thickened. Serve chilled with a sprinkle of cinnamon for a comforting dessert."),
                Recipe(image: SweetImageName.recipe8.rawValue,
                       name: "Sweet Cloud Pastries",
                       closeImage: SweetImageName.locked8.rawValue,
                       isOpen: false,
                       desc: "Make a choux pastry by cooking butter, water, and flour,\nthen beating in eggs. Pipe the dough onto a baking sheet and bake until puffed. Fill with whipped cream and dust with powdered sugar before serving."),
                Recipe(image: SweetImageName.recipe9.rawValue,
                       name: "Zesty Sunshine Squares",
                       closeImage: SweetImageName.locked9.rawValue,
                       isOpen: false,
                       desc: "Prepare a shortbread crust by mixing flour, sugar, and butter, then pressing into a baking dish. For the filling, whisk together lemon juice, zest, sugar, and eggs, then pour over the crust. Bake at 350°F\n(175°C) until set. Dust with powdered sugar before slicing."),
                Recipe(image: SweetImageName.recipe10.rawValue,
                       name: "Tropical Twist Cake",
                       closeImage: SweetImageName.locked10.rawValue,
                       isOpen: false,
                       desc: "Arrange pineapple slices and cherries in the bottom of a cake pan, then pour a batter made from flour, sugar, eggs, and pineapple juice over the fruit. Bake at\n350°F (175°C) until golden, then invert onto a plate to serve."),
                Recipe(image: SweetImageName.recipe11.rawValue,
                       name: "Sunny Freeze Treats",
                       closeImage: SweetImageName.locked11.rawValue,
                       isOpen: false,
                       desc: "Blend ripe mango flesh with yogurt, milk, and a touch of honey or sugar. Pour the mixture into popsicle molds and freeze until solid. Enjoy these creamy, fruity popsicles as a refreshing treat."),
                Recipe(image: SweetImageName.recipe12.rawValue,
                       name: "Nutty Delights",
                       closeImage: SweetImageName.locked12.rawValue,
                       isOpen: false,
                       desc: "Mix almond flour, sugar,\negg whites, and almond extract\nto form a dough. Shape into small cookies\nand bake at 325°F (165°C)\nuntil lightly golden. These\ndelicate cookies are perfect with tea or coffee.")]
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) == nil {
            UserDefaultsManager.defaults.set(1, forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(5, forKey: Keys.lifes.rawValue)
            UserDefaultsManager.defaults.set(5, forKey: Keys.timeCount.rawValue)
            UserDefaultsManager.defaults.set(1000, forKey: Keys.money.rawValue)
            UserDefaultsManager.defaults.set(0.5, forKey: Keys.backgroundVolume.rawValue)
            
            collectionItem = defaultRecipes()
            saveCollectionItems()
            saveShopItems(array: shopItems)
        }
    }
    
    
    func completeLevel() {
        let money = UserDefaultsManager.defaults.integer(forKey: Keys.money.rawValue)
        let currentLevel = UserDefaultsManager.defaults.integer(forKey: Keys.currentLevel.rawValue)
        
        if currentLevel <= 12 {
            UserDefaultsManager.defaults.set(currentLevel + 1, forKey: Keys.currentLevel.rawValue)
            UserDefaultsManager.defaults.set(money + 30, forKey: Keys.money.rawValue)
        }
    }
    
    func loseLevel() {
        let lifes = UserDefaultsManager.defaults.integer(forKey: Keys.lifes.rawValue)
        if lifes > 0 {
            UserDefaultsManager.defaults.set(lifes - 1, forKey: Keys.lifes.rawValue)
        }
    }
    
    func updateResource(keyToUpdate key: Keys, costInMoney cost: Int, countOfResourse: Int) {
        let resource = UserDefaultsManager.defaults.integer(forKey: key.rawValue)
        let money = UserDefaultsManager.defaults.integer(forKey: Keys.money.rawValue)
        
        if money >= cost {
            UserDefaultsManager.defaults.set(resource + countOfResourse, forKey: key.rawValue)
            UserDefaultsManager.defaults.set(money - cost, forKey: Keys.money.rawValue)
        }
    }
    
    
    func saveVolumeSettings(backgroundVolume: Float, soundEffectVolume: Float) {
        UserDefaultsManager.defaults.set(backgroundVolume, forKey: Keys.backgroundVolume.rawValue)
        UserDefaultsManager.defaults.set(soundEffectVolume, forKey: Keys.soundEffectVolume.rawValue)
    }
    
    func loadVolumeSettings() -> (Float, Float) {
        var backgroundVolume = UserDefaultsManager.defaults.float(forKey: Keys.backgroundVolume.rawValue)
        var soundEffectVolume = UserDefaultsManager.defaults.float(forKey: Keys.soundEffectVolume.rawValue)
        if backgroundVolume == 0.0 && soundEffectVolume == 0.0 {
            backgroundVolume = 0.5
            soundEffectVolume = 0.5
        }
        return (backgroundVolume, soundEffectVolume)
    }
    
    func saveCollectionItems() {
        if let encoded = try? JSONEncoder().encode(collectionItem) {
            UserDefaults.standard.set(encoded, forKey: Keys.collectionItem.rawValue)
        }
        
        objectWillChange.send()
    }
    
    func loadCollectionItems() {
        if let savedItems = UserDefaults.standard.data(forKey: Keys.collectionItem.rawValue),
           let decodedItems = try? JSONDecoder().decode([Recipe].self, from: savedItems) {
            collectionItem = decodedItems
        } else {
            collectionItem = defaultRecipes()
        }
        
        objectWillChange.send()
    }
    
    func getRandomAndOpenItem() -> Recipe? {
        let allItemsInCollection1Open = collectionItem.allSatisfy { $0.isOpen }
        
        let allItemsInCollection2Open = true

        if allItemsInCollection1Open && allItemsInCollection2Open {
            return nil
        }

        let selectedArray: [Recipe]
        var selectedArrayIndex: Int

        if !allItemsInCollection1Open {
            selectedArray = collectionItem
            selectedArrayIndex = 0
        } else {
            selectedArray = []
            selectedArrayIndex = 1
        }

        let closedItemsIndices = selectedArray.indices.filter { !selectedArray[$0].isOpen }
        
        guard let randomIndex = closedItemsIndices.randomElement() else {
            return nil
        }

        var selectedItem = selectedArray[randomIndex]
        selectedItem.isOpen = true

        if selectedArrayIndex == 0 {
            collectionItem[randomIndex] = selectedItem
        }

        saveCollectionItems()

        return selectedItem
    }
}
