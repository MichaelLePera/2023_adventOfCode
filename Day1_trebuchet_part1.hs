import Data.Char (isDigit, digitToInt)
import Data.Tuple
import System.Environment


-- string => char x char
getFirstAndLast :: String -> (Char, Char)
getFirstAndLast str = (head str, last str) 

-- f x a x a => b x b
mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple f (x, y) = (f x, f y)

pairToInt :: (Int, Int) -> Int
pairToInt (x, y) = x * 10 + y


calc = pairToInt . mapTuple digitToInt . getFirstAndLast . filter isDigit


sumLines = sum . map calc . lines

main :: IO ()
main = do
    args <- getArgs
    text <- readFile $ head args
    print $ sumLines text
    
