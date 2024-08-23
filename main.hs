import System.Process (callCommand)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStrLn "How many times do you want to commit?"
    hFlush stdout
    ipInput <- getLine
    let ip = read ipInput :: Int
    putStrLn "Auto git push when committed? (y/n)"
    hFlush stdout
    autoPush <- getLine
    mapM_ (\i -> callCommand $ "git commit --allow-empty -m \"Commit " ++ show i ++ " of " ++ show ip ++ "\"") [1..ip]
    putStrLn $ "Committed " ++ show ip ++ " times"
    if autoPush == "y"
        then callCommand "git push"
        else return ()
