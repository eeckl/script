@echo off
title YT Download Audio
cd C:\Users\Lowie\Documents\YTDL
set /p link=Enter link: 
yt-dlp.exe -i --add-metadata -x --audio-format mp3 %link%