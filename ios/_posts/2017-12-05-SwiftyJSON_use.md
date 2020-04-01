---
title: SwiftyJSON 라이브러리 사용법
layout: post
excerpt_separator: <!--more-->
---

스위프트에서 JSON 처리시 간편하게 사용가능

<!--more-->

#### Install
> pod 'SwiftyJSON'

#### Initialization
```swift
import SwiftyJSON

let json = JSON(data: dataFromNetworking)

let json = JSON(jsonObject)

if let dataFromString =
jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
    let json = JSON(data: dataFromString)
}
```

#### Subscript
```swift
//Getting a double from a JSON Array
let name = json[0].double

//Getting a string from a JSON Dictionary
let name = json["name"].stringValue

//Getting a string using a path to the element
let path = [1,"list",2,"name"]
let name = json[path].string

//Just the same
let name = json[1]["list"][2]["name"].string

//Alternatively
let name = json[1,"list",2,"name"].string

//With a hard way
let name = json[].string

//With a custom way
let keys:[SubscriptType] = [1,"list",2,"name"]
let name = json[keys].string
```

#### Loop
```swift
//If json is .Dictionary
for (key,subJson):(String, JSON) in json {
   //Do something you want
}
```

```swift
//If json is .Array
//The `index` is 0..<json.count's string value
for (index,subJson):(String, JSON) in json {
    //Do something you want
}
```

#### Error
```swift
let json = JSON(["name", "age"])
if let name = json[999].string {
    //Do something you want
} else {
    print(json[999].error) // "Array[999] is out of bounds"
}
let json = JSON(["name":"Jack", "age": 25])
if let name = json["address"].string {
    //Do something you want
} else {
    print(json["address"].error) // "Dictionary["address"] does not exist"
}
let json = JSON(12345)
if let age = json[0].string {
    //Do something you want
} else {
    print(json[0])       // "Array[0] failure, It is not an array"
    print(json[0].error) // "Array[0] failure, It is not an array"
}

if let name = json["name"].string {
    //Do something you want
} else {
    print(json["name"])       // "Dictionary[\"name"] failure, It is not an dictionary"
    print(json["name"].error) // "Dictionary[\"name"] failure, It is not an dictionary"
}
```

#### Optional getter
```swift
//NSNumber
if let id = json["user"]["favourites_count"].number {
   //Do something you want
} else {
   //Print the error
   print(json["user"]["favourites_count"].error)
}
//String
if let id = json["user"]["name"].string {
   //Do something you want
} else {
   //Print the error
   print(json["user"]["name"])
}
//Bool
if let id = json["user"]["is_translator"].bool {
   //Do something you want
} else {
   //Print the error
   print(json["user"]["is_translator"])
}
//Int
if let id = json["user"]["id"].int {
   //Do something you want
} else {
   //Print the error
   print(json["user"]["id"])
}
...
```

#### Non-Optional getter
```swift
//If not a Number or nil, return 0
let id: Int = json["id"].intValue

//If not a String or nil, return ""
let name: String = json["name"].stringValue

//If not a Array or nil, return []
let list: Array<JSON> = json["list"].arrayValue

//If not a Dictionary or nil, return [:]
let user: Dictionary<String, JSON> = json["user"].dictionaryValue
```

#### Raw object
```swift
let jsonObject: AnyObject = json.object
if let jsonObject: AnyObject = json.rawValue
//convert the JSON to raw NSData
if let data = json.rawData() {
    //Do something you want
}
//convert the JSON to a raw String
if let string = json.rawString() {
    //Do something you want
}

```

#### Existance
```swift
//shows you whether value specified in JSON or not
if json["name"].isExists()
```

#### Literal convertibles
```swift
//StringLiteralConvertible
let json: JSON = "I'm a json"

//IntegerLiteralConvertible
let json: JSON =  12345

//BooleanLiteralConvertible
let json: JSON =  true

//FloatLiteralConvertible
let json: JSON =  2.8765

//DictionaryLiteralConvertible
let json: JSON =  ["I":"am", "a":"json"]

//ArrayLiteralConvertible
let json: JSON =  ["I", "am", "a", "json"]

//NilLiteralConvertible
let json: JSON =  nil

//With subscript in array
var json: JSON =  [1,2,3]
json[0] = 100
json[1] = 200
json[2] = 300
json[999] = 300 //Don't worry, nothing will happen

//With subscript in dictionary
var json: JSON =  ["name": "Jack", "age": 25]
json["name"] = "Mike"
json["age"] = "25" //It's OK to set String
json["address"] = "L.A." // Add the "address": "L.A." in json

//Array & Dictionary
var json: JSON =  ["name": "Jack", "age": 25, "list": ["a", "b", "c", ["what": "this"]]]
json["list"][3]["what"] = "that"
json["list",3,"what"] = "that"
let path = ["list",3,"what"]
json[path] = "that"
```

#### Work with Alamofire
```swift
Alamofire.request(.GET, url).validate().responseJSON { response in
    switch response.result {
    case .Success:
        if let value = response.result.value {
          let json = JSON(value)
          print("JSON: \(json)")
        }
    case .Failure(let error):
        print(error)
    }
}
```
