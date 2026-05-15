@echo off
REM Publish to Git and Vercel - Double-click to push your changes

cd /d "e:\iProject\2026_Jasper\spartan-stoic"

echo Preparing to publish...
echo.

git add .
if errorlevel 1 (
    echo Error: Could not stage files
    pause
    exit /b 1
)

setlocal enabledelayedexpansion
REM Prompt for commit message
set /p commit_msg="Enter commit message (or press Enter for 'Publish updates'): "
if "!commit_msg!"=="" set commit_msg=Publish updates

git commit -m "!commit_msg!"
if errorlevel 1 (
    echo Error: Could not commit changes
    pause
    exit /b 1
)

echo.
echo Pushing to GitHub (Vercel will auto-deploy)...
git push

if errorlevel 1 (
    echo Error: Could not push to GitHub
    pause
    exit /b 1
)

echo.
echo Success! Your changes are published.
echo Check https://spartan-stoic.vercel.app in a moment to see them live.
echo.
pause
