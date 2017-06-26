0_WindowsでVagrantを使う前に
===

Vagrant使う前にWindowsの環境を整える

## MINGWのインストール

[Git for Windows](https://git-for-windows.github.io/img/git_logo.png)

## mingw-getのインストール

[MinGW \- Minimalist GNU for Windows \- Browse /Installer/mingw\-get at SourceForge\.net](https://sourceforge.net/projects/mingw/files/Installer/mingw-get/)

「Looking for the latest version?」をクリックすればOK

CLIバージョンでOK

## mingw-get のパスを通す

```
C:\MinGW\bin
```

デフォルトのままならこれでOK

## cmd.exe から rsync と ssh のインストール

```
mingw-get install msys-base
mingw-get install msys-openssl msys-openssh msys-rsync
```

## rsync/ssh へのパスを通す

```
C:\MinGW\msys\1.0\bin
```
