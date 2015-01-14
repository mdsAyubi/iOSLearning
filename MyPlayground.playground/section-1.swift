// Playground - noun: a place where people can play


import UIKit

var str = "Hello, playground"
var myName:String = "Viky"

myName = "Waquas"
var unitializedString:String
//var int:Int
var c:Double = 5/2

var int:Int=4
c*Double(int)

var arr = [2,3,6,8]
arr.removeAtIndex(0)
arr.append(10)

var aboutMe = ["name":"waquas", "age":25];

var name = aboutMe["name"]!
var age = aboutMe["age"]!

var myString = "my name is \(name) and my age is \(age)"


println(myString)

var time = 12

if name == "waquas" && time <= 12{
    
    println("Hello waquas and good morning")
}
else if name == "waquas" && time > 12{
    println("hello waquas and good afternoon")
}
else{
    println("who are you")
}

var inputNumber = 24

if (inputNumber % 2 == 0){
    println("Even")
}
else{
    println("Odd")
}

var myRandomNumber = arc4random_uniform(6) //will give a number between 0 and 6

for (var i=1;i<=10;i++){
    println(5*i);
}
















