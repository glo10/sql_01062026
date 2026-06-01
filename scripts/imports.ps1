<#
.SYNOPSIS
  Script PowerShell d'importation automatisée des bases de données Northwind.
.DESCRIPTION
  Télécharge les scripts .sql depuis Google Drive et les injecte dans les instances locales.
#>

# --- CONFIGURATION DES LIENS GOOGLE DRIVE ---
$DriveFiles = @{
    "sqlserver"  = "https://docs.google.com/uc?export=download&id=1G1FELERbTLVhynmt8G-2BoqWld4rGJna"
    "oracle"     = "https://docs.google.com/uc?export=download&id=1BfLgKeFs7sMqX_KzkuGMjxD1zcC9ZWdK"
    "postgresql" = "https://docs.google.com/uc?export=download&id=1MIWe-asVu92g2LUpg-ijtrkRTRGUExhD"
    "mysql"      = "https://docs.google.com/uc?export=download&id=14AKx1thgY0C8Gic-MSxPOab9vXDsRU3Q"
}

# --- CONFIGURATION DES ACCES LOCAUX ---
# ORACLE FREEPDB1 OR XEPDB1
$Config = @{
    SQLServer  = @{ Server = "localhost"; Database = "Northwind"; User = "sa"; Pass = "root" }
    Oracle     = @{ ConnectStr = "system/oracle@localhost:1521/FREEPDB1" }
    PostgreSQL = @{ Host = "localhost"; Port = "5432"; User = "postgres"; Db = "northwind"; Pass = "root" }
    MySQL      = @{ Host = "localhost"; Port = "3306"; User = "root"; Db = "northwind"; Pass = "root" }
}

$TmpDir = Join-Path $env:TEMP "Northwind_Imports"
if (-not (Test-Path $TmpDir)) { New-Item -ItemType Directory -Path $TmpDir | Out-Null }

Write-Host "=== Debut du processus d'importation Northwind (PowerShell) ===" -ForegroundColor Cyan

function Download-File ($Url, $OutputPath) {
    Write-Host "Telechargement du fichier vers $OutputPath..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UseBasicParsing
}

# --- 1. MICROSOFT SQL SERVER ---
Write-Host "`n[1/4] Importation SQL Server..." -ForegroundColor DarkCyan
$SqlFile = Join-Path $TmpDir "northwind_sqlserver.sql"
try {
    Download-File $DriveFiles["sqlserver"] $SqlFile
    sqlcmd -S $Config.SQLServer.Server -U $Config.SQLServer.User -P $Config.SQLServer.Pass -C -Q "IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Northwind') CREATE DATABASE Northwind"

    sqlcmd -S $Config.SQLServer.Server -U $Config.SQLServer.User -P $Config.SQLServer.Pass -d $Config.SQLServer.Database -C -i $SqlFile
    
    Write-Host "[OK] SQL Server importe avec succes." -ForegroundColor Green
} catch {
    Write-Error "Echec de l'import SQL Server : $_"
}

# --- 2. ORACLE DATABASE ---
Write-Host "`n[2/4] Importation Oracle..." -ForegroundColor DarkCyan
$OracleFile = Join-Path $TmpDir "northwind_oracle.sql"
try {
    Download-File $DriveFiles["oracle"] $OracleFile
    "@$OracleFile`nexit;" | sqlplus -S $($Config.Oracle.ConnectStr)
    Write-Host "[OK] Oracle importe avec succes." -ForegroundColor Green
} catch {
    Write-Error "Echec de l'import Oracle : $_"
}

# --- 3. POSTGRESQL ---
Write-Host "`n[3/4] Importation PostgreSQL..." -ForegroundColor DarkCyan
$PgFile = Join-Path $TmpDir "northwind_postgres.sql"
try {
    Download-File $DriveFiles["postgresql"] $PgFile
    $env:PGPASSWORD = $Config.PostgreSQL.Pass
    psql -h $Config.PostgreSQL.Host -p $Config.PostgreSQL.Port -U $Config.PostgreSQL.User -c "CREATE DATABASE $($Config.PostgreSQL.Db);" 2>$null
    psql -h $Config.PostgreSQL.Host -p $Config.PostgreSQL.Port -U $Config.PostgreSQL.User -d $Config.PostgreSQL.Db -f $PgFile
    $env:PGPASSWORD = $null
    Write-Host "[OK] PostgreSQL importe avec succes." -ForegroundColor Green
} catch {
    Write-Error "Echec de l'import PostgreSQL : $_"
}

# --- 4. MYSQL ---
# --- 4. MYSQL ---
Write-Host "`n[4/4] Importation MySQL..." -ForegroundColor DarkCyan
$MysqlFile = Join-Path $TmpDir "northwind_mysql.sql"
try {
    Download-File $DriveFiles["mysql"] $MysqlFile
    
    # On injecte temporairement le mot de passe dans la variable d'environnement MySQL
    $env:MYSQL_PWD = $Config.MySQL.Pass
    
    $MyHost = $Config.MySQL.Host
    $MyPort = $Config.MySQL.Port
    $MyUser = $Config.MySQL.User
    $MyDb   = $Config.MySQL.Db

    Write-Host "Creation de la base de donnees si inexistante..." -ForegroundColor Yellow
    mysql -h $MyHost -P $MyPort -u $MyUser -e "CREATE DATABASE IF NOT EXISTS $MyDb;"
    
    Write-Host "Injection du script SQL..." -ForegroundColor Yellow
    # Utilisation de cmd /c pour s'assurer que le flux passe correctement sans blocage de redirection
    cmd /c "mysql -h $MyHost -P $MyPort -u $MyUser $MyDb < `"$MysqlFile`""
    
    # Nettoyage de la variable de mot de passe
    $env:MYSQL_PWD = $null
    Write-Host "[OK] MySQL importe avec succes." -ForegroundColor Green
} catch {
    $env:MYSQL_PWD = $null
    Write-Error "Echec de l'import MySQL : $_"
}

# Nettoyage
Remove-Item $TmpDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "`n=== Importations terminees ! ===" -ForegroundColor Cyan