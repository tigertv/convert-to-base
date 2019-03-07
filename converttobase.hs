import Numeric (showIntAtBase)
import System.Environment
import Data.Char hiding (intToDigit)

intToDigit :: Int -> Char
intToDigit x
    | x >= 0 && x < 10 = chr(x + ord('0'))
    | x < 36 = chr(x - 10 + ord('a'))
    | x < 62 = chr(x - 36 + ord('A'))
    | otherwise = '_'

convert :: Integer -> Integer -> String
convert base number
    | base < 2 = "Error: wrong base"
    | number < 0 = "Error: negative number"
    | otherwise = showIntAtBase base intToDigit number ""

main :: IO ()
main = do
    x <- getArgs
    if length(x) == 2 then
        let 
            base = read (x!!0) :: Integer
            number = read (x!!1) :: Integer
        in
            putStrLn (convert base number)
    else
        putStrLn "Usage: ./converttobase base decimal-number"        
