import System.Process (callCommand)

main :: IO ()
main = do
    let ip = 600
    mapM_ (\i -> callCommand $ "git commit --allow-empty -m \"Commit " ++ show i ++ " of " ++ show ip ++ "\"") [1..ip]
    putStrLn $ "Committed " ++ show ip ++ " times"
    callCommand "git push"

