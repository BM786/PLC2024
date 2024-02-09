module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main =
    do
    initialiseIO
    putStrLn ("known results = " ++ show allResults)
    result <- getElement "result"
    putStrLn (show result ++ " leads to: " ++ show (result2Error result))
    
initialiseIO =
    do
    hSetBuffering stdout NoBuffering

data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, Read, Eq, Bounded, Enum)

data Result = Zero | Infinity | ABitDifferent | VeryDifferent
    deriving (Show, Read, Eq, Bounded, Enum)

allResults :: [Result]
allResults = [minBound .. maxBound]

result2Error :: Result -> Error
result2Error res = 
    case res of
        ABitDifferent -> FP_Rounding
        Infinity -> FP_Overflow
        Zero -> FP_Underflow
        VeryDifferent -> Int_Overflow

getElement elementTypeName =
    do
    hSetBuffering stdout NoBuffering
    putStr ("Input one " ++ elementTypeName ++ ": ")
    line <- getLine
    case parseElement line of
         Just element -> 
            do
            return element
         Nothing -> 
            do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName

parseElement line =
    case reads line of
        [] ->
            Nothing
        ((e,_) : _) ->
            Just e
