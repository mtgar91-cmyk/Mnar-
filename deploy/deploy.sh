#!/usr/bin/env bash
# شغّله بعد تعبئة DEV_ID في wrangler.toml:  bash deploy.sh
set -e
npm install -g wrangler
wrangler login
echo ">>> أنشئ مخزن KV، ثم انسخ الـ id الظاهر وضعه في wrangler.toml"
wrangler kv namespace create BOT_KV
read -p "اضغط Enter بعد وضع الـ id في wrangler.toml ... "
echo ">>> الصق توكن البوت:"
wrangler secret put BOT_TOKEN
echo ">>> اكتب كلمة سرية عشوائية (حروف وأرقام فقط):"
wrangler secret put WEBHOOK_SECRET
wrangler deploy
echo ">>> افتح رابط الـ Worker الظاهر أعلاه مضافاً إليه /set-webhook في المتصفح"
