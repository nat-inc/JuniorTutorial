import UIKit

var letters = Set<String>()

letters.insert("a")
letters.insert("b")

var fruits = Set<String>()


print(letters)

var genres:Set = ["Tennis","Soccer","Swim","Basket"]
var genres2:Set = ["Tennis","Swim","Judo","Baseball"]
var genres3:Set = ["Tennis","Basket"]
var genres4:Set = ["Soccer","Swim"]

var allGenres = genres.union(genres2).sorted()
print(allGenres)
//両方に含まれる全ての要素を合わせた新しいセット

var dublicate = genres.intersection(genres2).sorted()
print(dublicate)
//二つのセットの共通要素を含めた新しいセット

var sub = genres.subtracting(genres2).sorted()
print(sub)
//特定のセット（genres2）には含まれていない要素を含めた新しいセット

var symmetric = genres.symmetricDifference(genres2).sorted()
print(symmetric)
//どちらかだけにあって両方には含まれていない要素を含めた新しいセット

genres3.isSubset(of:genres)

genres3.isDisjoint(with:genres4)




































