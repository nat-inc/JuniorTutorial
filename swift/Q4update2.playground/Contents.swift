
func findWords(_ words: [String]) -> [String] {
  let rowOne = "qwertyuiop", rowTwo = "asdfghjkl", rowThree = "zxcvbnm"
  return words.filter { word in containsInrow(word.lowercased(), row: rowOne) || containsInrow(word.lowercased(), row: rowTwo) || containsInrow(word.lowercased(), row: rowThree) }
}
func containsInrow(_ word: String, row: String) -> Bool {
  return word.filter { c in !row.contains(c) }.count == 0
}
print(findWords(["Alaska","Peace","Dad"]))
