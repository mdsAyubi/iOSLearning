
// Playground - noun: a place where people can play


import UIKit

var str = "Hello, playground"
var myName:String = "Viky"

myName = "Waquas"
var unitializedString:String
//var int:Int
var c:Double = 5 / 2

var int:Int=4
c*Double(int)

var arr = [2,3,6,8]
arr.removeAtIndex(0)
arr.append(10)

var aboutMe = ["name":"waquas", "age":25];

var name = aboutMe["name"]!
var age = aboutMe["age"]!

var myString = "my name is \(name) and my age is \(age)"


print(myString)

var time = 12

if name == "waquas" && time <= 12{
    
    print("Hello waquas and good morning")
}
else if name == "waquas" && time > 12{
    print("hello waquas and good afternoon")
}
else{
    print("who are you")
}

var inputNumber = 24

if (inputNumber % 2 == 0){
    print("Even")
}
else{
    print("Odd")
}

var myRandomNumber = arc4random_uniform(6) //will give a number between 0 and 6

for (var i=1;i<=10;i++){
    print(5*i);
}

var array = [2,4,5,6]

for (var i=0;i<4;i++){
    print(array[i])
}

for x in array{
    print(x)
}


for (index,x) in array.enumerate(){
    print(index)
}

for (index,x) in array.enumerate(){
    array[index]=x/2;
}
array.count
print(array)

var i=2;
while(i<20){
    i=i+2;
    print(i)
}
i=0;
while(i<array.count){
    array[i]--;
    i++;
}


var number = 5;

var isPrime = true;
if (number == 1){
    isPrime = false;
}
if (number != 1 && number != 2){
    
    for (var j=2;j<number;j++){
        if((number % i) == 0){
            isPrime = false
        }
    }
}


func lessThanTen(x:Int)->Bool {
    return x<10
}


func removeItems(let x:[Int],condition:(Int->Bool)) ->Bool {
    
    for i in x {
        if condition(i) {
            return true
        }
    }
    return false
}

var x = [2,3,4,5,6,7,89]
removeItems(x, condition: lessThanTen)

var y = x.map {
        (num:Int) -> Int in
    
    if num % 2 == 1 {
            return  0
    }
    return num
}
print(y)

y=x.map { $0 * 3 }
print(y)

y = x.sort { return $0 < $1 }

print(y)

class NamedShape {
    var sideLength:Double
    var name:String
    
    init(name:String,sideLength:Double){
        self.name = name
        self.sideLength = sideLength
    }
    func simpleDescription()->String {
        return "A shape"
    }
}

class Square:NamedShape {
    override init(name:String,sideLength:Double) {
        super.init(name:name, sideLength: sideLength)
    }
    override func simpleDescription() -> String {
        return "A Square"
    }
    func area() ->Double {
        return sideLength * sideLength
    }
    
    var perimter:Double {
        get {
            return 4 * self.sideLength
        }
        set {
            print("Setting new sidelength")
            self.sideLength = newValue / 4
            print("Lenght= \(self.sideLength)")
        }
    }
}

var obj = Square(name: "Sqaure",sideLength: 4)
print(obj.area())
obj.perimter = 36
print(obj.sideLength)
print(obj.area())



enum Rank:Int {
    case Ace = 1
    case Two, Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    
    func simpleDescription() ->String {
        switch self {
        case .Ace: return "Ace"
        default: return String(self.rawValue)
        }
    }
}

print(Rank.Ace)

func compareRank(a:Rank,b:Rank) -> Int {
    return a.rawValue - b.rawValue
}

print(Rank.Ace,Rank.Jack)


enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription() ->String {
        switch self {
        case .Spades: return "Spades"
        case .Hearts: return "Hearts"
        case .Diamonds: return "Diamonds"
        case .Clubs: return "Clubs"
        }
    }
    func color() ->String {
        switch self {
        case .Clubs: fallthrough
        case .Spades: return "Black"
        default: return "Red"
        }
    }
}

print(Suit.Spades.color())

struct Card {
    var rank:Rank
    var suit:Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

var card = Card(rank: Rank.Ace, suit: Suit.Spades)
card.simpleDescription()


protocol ExampleProtocol {
    var simpleDescription:String {get}
    mutating func adjust()
}

class SimpleClass:ExampleProtocol {
    var simpleDescription:String = "A simple class.."
    func adjust() {
        simpleDescription += " Adjusted"
        print("Adjusted: \(self.simpleDescription)")
    }
}
var pObj:SimpleClass = SimpleClass()
print(pObj.adjust())


extension Int:ExampleProtocol {
    var simpleDescription:String {
        return "The number \(self)"
    }
     func adjust() {
        
        print(self)
    }
}

7.simpleDescription
7.adjust()


func repearItem<T>(item:T, numberOfTimes:Int) ->[T] {
    var list = [T]()
    for _ in 0..<numberOfTimes {
        list.append(item)
    }
    return list
}

print(repearItem("hello ", numberOfTimes: 4))

var errorCode:String?

errorCode = "Error"

print(errorCode?.lowercaseString)

class TimesTable {
    var multiplier:Int
    init(multiplier:Int){
        self.multiplier = multiplier
    }
    subscript(index:Int) ->Int {
        return multiplier * index
    }
}

var threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])

func swapGenericValues<T>(inout a:T, inout b:T){
    let temp:T = a
    a=b;
    b=temp
}

var a = 2
var b = 3
swapGenericValues(&a, b: &b)
print("\(a) \(b)")

struct Stack<E> {
    var array = [E]()
    
    mutating func push(element:E){
        print("Pushing to array, content \(element): \(array)")
        array.append(element)
    }
    
    mutating func pop() -> E {
        return array.removeLast()
    }
    
}

var stackOfString = Stack<String>()
stackOfString.push("one")
stackOfString.push("two")
//stackOfString.push("three")

print(stackOfString)


func findIndex<T:Equatable>(items:[T],valueToFind:T) -> Int? {

    for (index,value) in items.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

extension Double {
    var million:Double {
        return self / 1_000_000
    }
}

var wireAmount:Double = 110000000
print(wireAmount.million)

extension Int {
    func repeatTimes(task:()->Void) {
        for _ in 1...self{
            task()
        }
    }
}

3.repeatTimes { () -> Void in
    print("Hello...")
}











