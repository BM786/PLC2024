ask :: String -> Int -> IO ()
ask prompt count = do
  let promptWithExclamation = prompt + replicate count '!'
  putStrLn promptWithExclamation
  line <- getLine
  if line == "quit"
    then putStrLn "quitting. . ."
    else if line == ""
    then ask prompt (count + 1)
    else do
    putStrLn ("you said: " ++ reverse line)
    ask prompt 0

main :: IO ()
main =
  do
  let initialPrompt = "please say something"
  ask initialPrompt 0