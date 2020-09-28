@echo off

:: If a command fails then the deploy stops
:: set -e

echo "\033[0;32mDeploying updates to GitHub...\033[0m\n"

:: Build the project.
hugo & :: if using a theme, replace with `hugo -t <YOURTHEME>`

:: Go To Public folder
cd public

:: Add changes to git.
git add .

:: Commit changes.
set msg="rebuilding site %$(date)%"
:: if ( -n "*" ) ( %msg%="$*" )
git commit -m "%msg%"

:: Push source and build repos.
git push origin master