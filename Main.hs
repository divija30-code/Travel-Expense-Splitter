import Text.Printf
import Data.List (foldl')
import qualified Data.Map as Map

type Name = String
type Amount = Float
type Desc = String

-- Add expense to map
addExpense :: Map.Map Name Amount -> (Name, Amount, Desc) -> Map.Map Name Amount
addExpense m (name, amt, _) =
    Map.insertWith (+) name amt m

-- Calculate balances
calculateBalances :: Float -> [(Name, Amount)] -> [(Name, Float)]
calculateBalances share totals =
    map (\(n, amt) -> (n, amt - share)) totals

-- Print final result
printResult :: (Name, Float) -> IO ()
printResult (name, bal)
    | bal > 0   = printf "%s should receive ₹%.2f\n" name bal
    | bal < 0   = printf "%s should pay ₹%.2f\n" name (abs bal)
    | otherwise = printf "%s is settled\n" name

main :: IO ()
main = do
    putStrLn "🚗 Travel Expense Splitter (Detailed)"

    -- Number of entries
    putStr "Enter number of expense entries: "
    nStr <- getLine
    let n = read nStr :: Int

    -- Input entries
    putStrLn "\nEnter details:"
    entries <- sequence [
        do
            putStr "\nName: "
            name <- getLine

            putStr "Amount: ₹"
            amtStr <- getLine

            putStr "Paid for: "
            desc <- getLine

            let amt = read amtStr :: Float
            return (name, amt, desc)
        | _ <- [1..n]
        ]

    -- Show all entries
    putStrLn "\n--- Expense Details ---"
    mapM_ (\(n, amt, d) ->
        printf "%s paid ₹%.2f for %s\n" n amt d) entries

    -- Combine totals per person
    let totalsMap = foldl' addExpense Map.empty entries
    let totals = Map.toList totalsMap

    -- Calculate total and share
    let totalExpense = sum (map snd totals)
    let peopleCount = length totals
    let share = totalExpense / fromIntegral peopleCount

    putStrLn "\n--- Total Paid by Each Person ---"
    mapM_ (\(n, amt) -> printf "%s paid total ₹%.2f\n" n amt) totals

    putStrLn "\n--- Summary ---"
    printf "Total Expense: ₹%.2f\n" totalExpense
    printf "Each person should pay: ₹%.2f\n" share

    -- Final balances
    let balances = calculateBalances share totals

    putStrLn "\n--- Final Settlement ---"
    mapM_ printResult balances
