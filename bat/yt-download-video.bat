@echo off
title YT Download Video
cd C:\Users\Lowie\Documents\YTDL
set /p link=Enter link: 
yt-dlp.exe -i --add-metadata %link%