Update-Exe-All.ps1
==================

A PowerShell script that overwrites the specified executable file to a file with the same name in the directory specified by the environment variable PATH.

(Japanese: 指定された実行ファイルを、環境変数PATHで指定されたディレクトリの同名ファイルに上書きコピーする PowerShell スクリプトです )

```
C:> Update-Exe-All.ps1 Update-Exe-All.ps1
Update "C:\Users\hymkor\Share\cmds\Update-Exe-All.ps1" ? [y|n]: y

    Directory: C:\Users\hymkor\Share\cmds

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---   2024/01/18 木曜日    12:20            695 Update-Exe-All.ps1
```

If the file to be overwritten is in use and cannot be written directly, avoid overwriting errors by renaming it and replacing it.

(Japanese: 上書きされるファイルが使用中で直接書き込めない場合、リネームしてから差し替えることで上書きエラーを回避します )

```
C:> Update-Exe-All.ps1 nyagos.exe
Update "C:\Users\hymkor\OneDrive\Share\bin64\nyagos.exe" ? [y|n]: y

    Directory: C:\Users\hymkor\OneDrive\Share\bin64

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
la---   2024/01/03 水曜日     0:43        6070272 nyagos.exe-2079168037
-a---   2024/01/26 金曜日    15:55        6070272 nyagos.exe
```

Download and Install
--------------------

On the directory where the environment variable PATH specifies.
( 書き込み可能な、環境変数 PATH が指定するディレクトリにて )

```
curl -O https://raw.githubusercontent.com/hymkor/Update-Exe-All.ps1/master/Update-Exe-All.ps1
```

When the scoop-installer is avilable,
( scoop-installer が使える場合 )

```
scoop bucket add hymkor https://github.com/hymkor/scoop-bucket
scoop install Update-Exe-All.ps1
```
