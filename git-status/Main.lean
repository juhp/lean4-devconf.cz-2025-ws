import Init.System.FilePath

open System.FilePath

def gitStatus (dir: System.FilePath) : IO Unit := do
    let cfg :=
      { cmd := "git"
        args := #["status", "--short", "--untracked-files=no"]
        cwd := dir
      }
    let out <- IO.Process.run cfg
    if out.length > 0 then
      let child <- IO.Process.spawn cfg
      _ <- child.wait

def checkDir (header _git: Bool) (dir: System.FilePath) : IO Unit := do
  if (← dir.isDir) then
    if (← (dir / ".git").isDir) then
      if header then IO.println $ s!"\n# {dir}"
      gitStatus dir

open IO.FS.DirEntry in
def main (args : List String) : IO Unit := do
  let (ls,git) <-
    if args.isEmpty then
      let gitdir := System.FilePath.mk ".git"
      if (← gitdir.isDir)
      then pure (#[System.FilePath.mk "."],true)
      else
      let ents <- readDir "."
      pure $ (ents.map path,false)
    else pure (args.toArray.map System.FilePath.mk,false)
  for f in ls do
    checkDir (ls.size > 1) git f
