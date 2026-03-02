# Caminho padrão do arquivo de histórico do PowerShell
$history = (Get-PSReadlineOption).HistorySavePath

# Verifica se o arquivo existe
if (Test-Path $history) {
    $lastModified = (Get-Item $history).LastWriteTime
    $sevenDaysAgo = (Get-Date).AddDays(-7)

    # Verifica se o arquivo foi modificado dentro dos 7 dias
    if ($lastModified -ge $sevenDaysAgo) {
        Write-Host "--- Histórico de comandos (últimos 7 dias) ---" -ForegroundColor Yellow
        Get-Content $history | Select-Object -Unique | Out-String
        # Get-Content -> Joga tudo numa lista simples
        # Select-Object -Unique -> Remove duplicatas
        # Out-String -> Joga tudo numa string
    }
    else {
        Write-Host "Nenhum comando recente encontrado nos últimos 7 dias." -ForegroundColor Red
    }
}
else {
    Write-Warning "Arquivo de histórico não encontrado."
}