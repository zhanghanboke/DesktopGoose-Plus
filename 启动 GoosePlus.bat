@echo off
chcp 936 >nul 2>nul
cd /d "%~dp0"
if not exist "GooseDesktop.exe" (
  echo ERROR: GooseDesktop.exe not found. Run this from the package folder.
  pause
  exit /b 1
)

rem 本包里的 GooseDesktop.exe 已经打过补丁：原程序那句模态的
rem "Mod Enabler Warning"（是/否）确认框被去掉了，直接双击它也能加载 Mod。
rem 改动只有 5 个字节（把 MainGame::Init() 里那条 call MessageBox::Show
rem 换成等长的 pop x4 + ldc.i4.6），细节见 使用说明.txt。
rem
rem GoosePlusLauncher.exe 是「没打补丁」时的老办法（它替你点「是」）。
rem 留着只是备用 —— 万一你把 GooseDesktop.exe 换回原版，可以用它启动。
rem 平时用不到。
start "" "GooseDesktop.exe"
