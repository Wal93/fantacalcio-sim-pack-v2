$content = Get-Content 'C:\Users\walte\Desktop\fantacalcio-sim-pack-v2\fantacalcio-sim\db\seeds\populate_real_players_SERIEA2025_26_complete.sql' -Raw
$content = $content -replace "VALUES \([^)]+\);", {$_.Value -replace "\);", ") ON CONFLICT DO NOTHING;"}
$content = $content -replace "BEGIN;", ""
$content = $content -replace "COMMIT;", ""
$content | Set-Content 'C:\Users\walte\Desktop\fantacalcio-sim-pack-v2\fantacalcio-sim\db\seeds\populate_real_players_SERIEA2025_26_complete.sql'