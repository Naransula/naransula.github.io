@echo off
echo ==========================================
echo Preparing files for Netlify deployment...
echo ==========================================

:: 1. Create a temporary folder for the live site
mkdir deploy_temp

:: 2. Copy ONLY the safe files (ignoring admin.html)
copy index.html deploy_temp\ >nul
xcopy images deploy_temp\images\ /E /I /Y >nul

echo.
echo ==========================================
echo Pushing to Netlify...
echo ==========================================

:: 3. Deploy the temporary folder to production
netlify deploy --dir=deploy_temp --prod

echo.
echo ==========================================
echo Cleaning up...
echo ==========================================

:: 4. Delete the temporary folder
rmdir /s /q deploy_temp

echo.
echo Deployment Complete!
pause