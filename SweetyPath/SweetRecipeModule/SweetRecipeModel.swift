import SwiftUI

struct Recipe: Codable, Equatable {
    let image: String
    let name: String
    let closeImage: String
    var isOpen: Bool
    var desc: String
}

struct SweetRecipeModel {
    let collectionItem = [Recipe(image: SweetImageName.recipe1.rawValue,
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
                                 desc: "Core apples and fill the centers with a mixture of oats, brown sugar, cinnamon, and butter. Place the apples in a baking dish with a bit of water and bake at 350°F (175°C) until tender. Serve warm with a dollop of whipped cream."),
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
                                 desc: "Make a choux pastry by cooking butter, water, and flour, then beating in eggs. Pipe the dough onto a baking sheet and bake until puffed. Fill with whipped cream and dust with powdered sugar before serving."),
                          Recipe(image: SweetImageName.recipe9.rawValue,
                                 name: "Zesty Sunshine Squares",
                                 closeImage: SweetImageName.locked9.rawValue,
                                 isOpen: false,
                                 desc: "Prepare a shortbread crust by mixing flour, sugar, and butter, then pressing into a baking dish. For the filling, whisk together lemon juice, zest, sugar, and eggs, then pour over the crust. Bake at 350°F (175°C) until set. Dust with powdered sugar before slicing."),
                          Recipe(image: SweetImageName.recipe10.rawValue,
                                 name: "Tropical Twist Cake",
                                 closeImage: SweetImageName.locked10.rawValue,
                                 isOpen: false,
                                 desc: "Arrange pineapple slices and cherries in the bottom of a cake pan, then pour a batter made from flour, sugar, eggs, and pineapple juice over the fruit. Bake at 350°F (175°C) until golden, then invert onto a plate to serve."),
                          Recipe(image: SweetImageName.recipe11.rawValue,
                                 name: "Sunny Freeze Treats",
                                 closeImage: SweetImageName.locked11.rawValue,
                                 isOpen: false,
                                 desc: "Blend ripe mango flesh with yogurt, milk, and a touch of honey or sugar. Pour the mixture into popsicle molds and freeze until solid. Enjoy these creamy, fruity popsicles as a refreshing treat."),
                          Recipe(image: SweetImageName.recipe12.rawValue,
                                 name: "Nutty Delights",
                                 closeImage: SweetImageName.locked12.rawValue,
                                 isOpen: false,
                                 desc: "Mix almond flour, sugar, egg whites, and almond extract to form a dough. Shape into small cookies and bake at 325°F (165°C) until lightly golden. These delicate cookies are perfect with tea or coffee.")]
}


