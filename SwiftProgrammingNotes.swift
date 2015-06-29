//Swift Programming Notes

println("hello, WWDC")

//Safe Modern Powerful

//1. The Basics

//a. Variables:
var varName="Awesome"
let varName: String = "Awesome"

var version: Double=1.0
let isAwesome:Bool = true

//Prefer immutabilty and uses type inference.


//***String:
//Unicode names can also be used.
let s = "I am a string";

//All the properties of NSString is available in the class String too.

//We can iterate through a string like this:

for character in "mouse"{
	println(character)
}

//Has unicode String. String can be used as NSString
//for in loop to interate in a string.
//Concatenation by using +.

//String interpolation
//eg let mathResult="\(a) times \(b) is \(a*b)"

//Cant add to constant string but can add to a variable String. Constant string addition gives compile time error.

//***Array and String:
//Array can be used as NSArray
//Dictionary can be used as NSDictionary

//Can be used with any types. But if you want to constrain what types can be added to an array, this is the syntax

var names:[String] = ["abc", "def","ghi"];

var names = ["abc","def","ghi"]
var legs = ["anr":6,"snake":0]

//OR
var names:[String] = ["abc","def"]
//We have typed collections.


//***Loops:
//while, do while..{}
for i in 1...5 {}//closed interval
for i in 1..5 {}//half open interval--more familiar

//For iterating over dict using for in loop:

for (animalName, legCount) in numberOfLegs {
	println("\(animalName) have \(legCount) legs")
}
//Tuples which can be passed around.

//***Modifying Array
var shoppingList = ["Eggs", "milk"]
print(shoppingList[0]);

shoppingList += "Flour"
shoppingList += ["Cheese","Butter"]


//shoppingList[3...5] = ["Banana","Apples"] --will change the values from 3 to 5 (both included) to Banana and Apples

//To modify a dictionary, just add a key which does was not present before. Or to modify, just give a new value to the key, eg

numberOfLegs["spider"] = 8
numberOfLegs["spider"] = 245

//***Optionals in a dictionary
//When there can be a value or there cant be, instead of handling like 0 or -1 for some other logic, we can use optionals like this

let possibleLegs : Int? = numberOfLegs["dog"];

if (possibleLegs == nil){
	println("Nor found")
}else{
	let legs = possibleLegs!
	println("Found...")
}
//The exclamation is used to force the unwrapping of the value present inside. We use exclamation only when we know for sure that the value is present eg, we can check for nil value as above and in the else part when we are sure tht the optionsal value is not null, we can unwrap it.

//For a much better and safer code use the following method:

if let legCount = possibleLegs {
	println("A dog with the \(legCount)")
}else{
	println("It walks")
}

//***If else: small brackets are not required but braces are required.

//***Switch

switch legCount{
	case 0: println("Slithers...")
	case 1: println("It hops")
	default: println("It walks");
}

//Cases in swift does not fall through. And can match againsts objects. Or multiples values.
//Switch must be exhaustive. Shud have all the cases. Best way is to add a default statment. A lot safer code this way.

//Can also be matched against ranges. Wow!!

//***Functions

func sayHello(){
	println("Hello");
}

//To call a method: sayHello();

//Parameters:
func sayHello(name: String){
	println("Hello \(name)");
}

//Default params
func sayHello(name: String="World"){
	println("Hello \(name)");
}

//Return type of a function

func sayHello(name: String="World") -> String{
	return "Hello" + name
}

let greet = sayHello() // No need to provide type for the variable greet, it is inferred from the value of the return type of the function.

//Returning Multiple Values:

func refreshWeb() -> (Int, String) {
	
	return (200, "Success")
}

//Tuples: A group of values of any type
eg (3.4,5.9,"Not Found", 2)


let (status,message) =  refreshWeb()

println("Received \(status) and \(message)")

//We can even name the results we receive , like this

func refreshWeb() ->(code:Int,message:String){
	return (200,"Success")
}

let status = refreshWeb()
println("Received \(status.code): \(status.message)")

//Closures: Group of code which can be passed around e.g

if greeting {
	println ("Hello World")
}


//The compiler interprets the above closure as:

let greeting ()->(){
	println ("Hello World")
}

//Which is similar to functions , because functions are nothing but named closures in Swift.

//Clousres can be around as parameters:

func repeat(count:Int,task()->()){
	for i in 0..count{
		task()
	}
}

//Lets call this now:
repeat(2,{
	println("Hello")
})

//Will print Hello twice. We are sending a block of code which is received as a closure.

//If the closure you want to send is the last argument then it can be taken out of the fucntion call like below,

repeat(2){
	println("Hello")
}
//This is more readable, repeat twice, the code that follows. Much more modern.



***Classes

class Vehicle{

	var numberOfWheels = 0; //stored property

	var description:String{
		get{
			return "\(numberOfwheels) wheels"
		}
		set{

		}
	}// this is computed property
	
}
//When a property is readonly, you can remove the braces from the get method.

//Subclasses

class Bicycle:Vehile{
	
}

//Object Initialization:
let someVehicle = Vehicle()

//We can use the . to get the properties defined earlier

let someVehicle = Vehicle()

println(someVehicle.description)

//The way to give the properties a default value for every object created is by defining init() method in the class, like a constructor

//Call super.init() to call the base class' init.

//Overriding a Property

class Car: Vehicle {
	var speed = 0.0
	init(){
		super.init()
		numberOfWheels = 4
	}
	override var description: String {
        get{
            return "blah"
        }
	}
}
/*Writing over ride makes the code as we are clearly telling the compiler that this behavior is overridden. Also, the compiler goes and checks if this property exists in the base class and then over rides intead of some behavior which we might not even know about.
*/
//Property Observers:
//Sometimes there is a need to know when a property is changing. Toachieve this, we have a concept of property observers

//here is an example,

class ParentsCar: Car{
	
	override var speed:Double{
		willSet{
			//newValue can be used
            if newValue > 65.0 {
				println("Careful")
		}
		didSet{
			//oldValue 
		}
	}
}

//Will set is called just before changing the value and didSet is called just after changing the value.

//Methods:

class Counter {
	
	var count = 0;
	func increment() {
		count++
	}
	func resetCount(count:Int){
		self.count = count
	}

}


//***Structures

//Defined using struct key word eg

struct Point{
	var x,y: Double
}

struct Size{
	var width,height:Double
}

struct Rect {
	var origin:Point
	var size: Size
}


var point = Point(x:0.0, y:0.0)
var size = Size(width:640.0,height:480.0)
var rect = Rect(origin:point,size:size)

//Structure can have properties and methods.

//Structures cant inherit. Structures are passed bby values and classes by reference.

//If using let, vars inside a struct also becomes mutable.

//Use "mutating"

//*** Enumaeration:
enum Planet:Int{
	case Mercury=1,Venus, Earth
}

let earthNum = Planet.Earth.toRaw()

enum Compass{
	case North,South,East,West
}

var directio = Compass.West
//type inferred
//direction = .East

//***Enumeration: Associated Values

enum TrainTimes{
	case OnTime
	case Delayed(Int)
}

var status = TrainTime.OnTime
//status = .Delayed(42)

//We can also use init in enums like this

enum TrainTime{
	case OnTime,Delayed(Int)
	init(){
		self = OnTime 
	}
}

var status = TrainTime()
//status.description

//***Extensions
extension Size{
	mutating func increaseByFactor(factor:Int){
	width *= factor
	height *= factor 
	}
} //can extend statndard type 

//eg

extension Int {
	func repetitions(task:() -> ()){
		for i in 0..self{
			task()
		}
	}
}

500.repetitions({
	
	println("Hello")
})
//We just extended Int with a new method called repetitions.

//Since closure is the last arg, we can remove the () and write like this

500.repetitions{
	println("Hello")
}


  


















































































































 

































































































