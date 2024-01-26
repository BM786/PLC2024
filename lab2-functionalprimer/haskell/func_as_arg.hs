-- create inpFunc with a range [a..b]
inpFunc :: [Int]
inpFunc = [1..5]

-- Define applicatorFunc to accept any list of integers and a flag 's' for sum, 'a' for average
applicatorFunc :: [Int] -> Char -> Double
applicatorFunc inpFunc flag
  | flag == 's' = fromIntegral $ sum inpFunc
  | flag == 'a' = fromIntegral (sum inpFunc) / fromIntegral (length inpFunc)
  | otherwise   = error "Invalid flag"

main :: IO ()
main = do
  let result = applicatorFunc inpFunc 'a' -- Call applicatorFunc with inpFunc and 'a' as args
  putStrLn $ case resultType of
    's' -> "Sum = " ++ show result
    'a' -> "Average = " ++ show result
    _   -> "Invalid result type"

-- Define the type of result you want ('s' for sum, 'a' for average)
resultType :: Char
resultType = 'a'
    