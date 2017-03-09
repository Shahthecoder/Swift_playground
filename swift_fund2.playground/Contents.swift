import UIKit

//1

for i in 1...255 {
    print(i)
}

var index = 1

while index <= 255 {
    print(index)
    index += 1
}

//2

for i in 1...100{
    if (i % 3 == 0 || i % 5 == 0) && i % 15 != 0{
        print(i)
    }
}


//3

for i in 1...100{
    if i % 15 == 0 {
        print("FizzBuzz")
    }else if i % 3 == 0{
        print("Fizz")
    }else if i % 5 == 0 {
        print("Buzz")
    }
}

