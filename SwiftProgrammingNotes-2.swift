/**Topics**
	Optionals
	Memory Management
	Initialization
	Closures
	Pattern Matching
*/
//***Optionals
//Case of String to Integer conversion

//Optionals reperesent possibly missing values and comes in 2 different states

//One is where value is missing eg var optionalNum:Int?
//By default initialized to nil. Nil can be anything like a null ref or primitive. There is no distinction. It just means value is missing.

//And the other state is having some value like
//optionalNumber = 6.

//Non optional types like String and Integer cant be nil.

//eg
var myString:String = "A string " //Okay
var myString: String = nil //Compiler time error

//You know it will be there

func findIndex(string: String, array:[String]) -> Int?{
	
	for (index, value) in enumerate(array){
        if value == string {
			return index
        }
	}
	return nil //No need to return -1 or something like that
}

//Unwrapping Optionals:
var neighbour = ["A","B","C"]
let index:Int? = findIndex("A",neighbour)

if index {
	println("Hello \(neighbout[index])")
}
else{
	println("Not found")
}

println("Hello \(neighbout[index])")
//will create a problem at runtime saying optional value is not unwrapped. We can get rid of it using ! like this

println("Hello \(neighbout[index! ])")
//but thhis is not safe. We are not sure that we got the value.


//There is a better way of doing like this

if let indexValue = index {
	//...code
}

//This code will unwrap if the value of index exists and then assign it to indexValue.
//Or even shorter way like this
if let indexValue = findIndex("A",neighbour) {
	
	//indexValue if regular old int
}

//*Optional Chaining
//If there are nested hierarchical optional values like Person class has Residence class which has Address class which has optional values, we can use a syntax like this

addressNum = paul.residence?.address?.buildingNum?.toInt()


//If all the references are ok, an Int is returned else nil is returned

//In the above code addressNum is optional. So to use ut we have to unwrap it still. But we can combine the if let syntax and the optional chaining like this

if let addressNum = paul.residence?.address?.buildingNum?.toInt(){
	addToDB("Paul",addressNum)
}

//Optionals are generic enumeration of any type, expressed like this

enum Optional<T>{
	case None
	case Some(T)
}


//Use case of optionals
//1. While working with missing values where missing values are nil of present values are wrapped in an optional

//You can unwrap the optional value to access its underlying value using the ! syntax but only do when you are sure of it.
//Else, use the if let optional binding to test and unwrap at the same time


//Use optional chaining for multiple values chained where one or many can be missing



/***Memory Management
Memory managemnet in Swift is done throught Automatic Reference Counting. When all the reference to an object goes out of scope, the object is de allocated.

For cycles:Actually the references we keep are weak which tells that this reference is not reposible to keep the object alive. 

Weak refrences are modelled as optional values and support all the operations of a optional value.	

Strong references are those when we have ownership of objects we use.

Weak references are the objects we use whose lifetime is independent of ours and they dont depend on us.

Unowned references are great as back references from owned objects to their owners. If part of object graph goes away, entire object graph goes away. Like credit cards cant exist without valid owners.
*/

//***Initialization
//Every value must be initialized before it is used.

var message:String

if sessionStarted{
	message = "Hello";
}
println(message)

//The above code gives a compiler error because we have not onsidered every branch of code in the if statement and hence it will give error.

//The compiler catched all the branches and gives a compile time error.

//In case of structures: All the members must be initialized before usage. Compiler takes care of it

//You can give default values also
struct Color{
	let red = 0.0, green = 0.0, blue = 0.0
	init(grayScale:Double){
		red = grayScale
		green = grayScale
		blue = grayScale
	}
}

//If forget to initialize one, compile time error
init() {} //invoked at object creation
//Method on self cant be called unless all the properties are not initialized.

//Can be set using by giving the properties as arguments while making object of Color


//Class Initialization
//The child class initializers are called before the parent class init. !!!

//**Delegated Initializers
//**Convinience Initliazers
//Convinience ini calls the delegated init to set the actual props

//How do we use convinience init

class RaceCar:Car{
	var hasTurbo:Bool

	init(color:Color,turbo:Bool){
		hasTurbo = turbo
		super.init(color: color)
	}

	convinience init(color: Color){
		self.init(color:color,turbo:true)
	}

	convinience init() {
		self.init(color:Color(gray:0.4))
	}

}

//**Lazy Propperties
//When we dont want to initialize a property and defer it to some later time, we can use @lazy annotation

class Game{
	@lazy var multiPlayer = MultiplayerManager
}

//**Deinitialization

class A{
	deinit{
		closeFile(file)
		...
	}
}
//Init all values before using
//Set all stored props first then call super.init

//Designated inits only delegte up
//Convinience inits only delegate across

//Deinitializers are there if needed

//***Closures
//Sort method case, instead of writing various ways of sorting, write one way and send a closure

var clients = ["A","B","C"]

clients.sort({
	(a:String,b:String)->Bool in
	return a<b	
})

//Using type inference the above expression can be reduced to

clients.sort({
	(a,b) in
	return a<b	
})

//Also, if only one line return statement like above is present, then we can use this

clients.sort({ a,b in a<b})
//or
clients.sort({ $0 < $1 })
//or
clients.sort{ $0 < $1 }

//Functional Programming becomes easier , eg

words.filter{$0.hasSuffix("gry")}
		.map{ $0.uppercaseString }
		.reduce("HULK"){"\($0  \($1"}


//Closures can take method names
















































































































































