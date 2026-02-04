$timeout = new-timespan -Minutes 10
$sw = [diagnostics.stopwatch]::StartNew()

Write-Host "Menunggu instalasi Git selesai (Maksimal 10 menit)..." -ForegroundColor Cyan

while ($sw.Elapsed -lt $timeout) {
    if (Get-Command git -ErrorAction SilentlyContinue) {
        Write-Host "Git berhasil terdeteksi!" -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 5
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Waktu habis. Git belum terdeteksi. Silakan coba install manual atau restart terminal." -ForegroundColor Red
    exit
}

# Konfigurasi user (Opsional, user mungkin perlu set sendiri)
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"

Write-Host "Menginisialisasi repository Git..." -ForegroundColor Cyan
git init
git add .
git commit -m "Initial commit: Landing Page Personal"

Write-Host "`nRepository Git lokal SIAP!" -ForegroundColor Green
Write-Host "Langkah selanjutnya untuk upload ke GitHub:" -ForegroundColor Yellow
Write-Host "1. Buka https://github.com/new di browser."
Write-Host "2. Buat repository baru (kosong)."
Write-Host "3. Salin perintah '...or push an existing repository from the command line'."
Write-Host "4. Paste perintah tersebut di terminal ini."
Write-Host "`nContoh perintah:"
Write-Host "git remote add origin https://github.com/USERNAME/REPO_NAME.git"
Write-Host "git branch -M main"
Write-Host "git push -u origin main"
