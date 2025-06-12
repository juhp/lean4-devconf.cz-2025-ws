-- Basic IO

import Init.System.FilePath

def meetAndGreet : IO Unit := do
  IO.println "What is your name?:"
  let stdin <- IO.getStdin
  let name <- stdin.getLine
  IO.println s!"Nice to meet you, {name}"

------

-- # list a directory

def List.sortFiles (fs : List System.FilePath) : List System.FilePath :=
  fs.mergeSort (fun f1 f2 => f1.toString ≤ f2.toString)

def listDirectory (dir : System.FilePath) : IO (List System.FilePath) := do
  if (<- dir.isDir) then
    let dents <- dir.readDir
    pure $ (dents.toList.map IO.FS.DirEntry.path).sortFiles
  else pure []

#eval listDirectory (System.FilePath.mk "DevconfCZ2025")
