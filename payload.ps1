# Define caminho do AppData
$appDataPath = "$env:APPDATA\evil.exe"

# Conteúdo simulado do executável (apenas um placeholder binário)
[IO.File]::WriteAllBytes($appDataPath, [byte[]](1..100))

# Cria o serviço com sc.exe apontando para o executável no AppData
$serviceName = "EvilService"
$binPath = "`"$appDataPath`""

# Comando SC completo
$scCommand = "create $serviceName binPath= $binPath"

# Executa o sc.exe para criar o serviço
Start-Process -FilePath "sc.exe" -ArgumentList $scCommand -WindowStyle Hidden -Wait

# (Opcional) Inicia o serviço
# Start-Process -FilePath "sc.exe" -ArgumentList "start $serviceName" -WindowStyle Hidden -Wait
