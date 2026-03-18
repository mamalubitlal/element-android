# 🥞 чатор Android - Ready to Build!

Your custom чатор Android app is **ready to push and build on GitHub Actions (FREE)!**

---

## ⚡ Quick Start (3 Steps)

### 1️⃣ Fork Element Android

Go to: https://github.com/element-hq/element-android
- Click **Fork**
- Wait for fork to complete

### 2️⃣ Push чатор Code

Run this in the `chator-android-temp` folder:

```bash
./PUSH_TO_GITHUB.sh
```

It will ask for:
- Your GitHub username
- Connection method (HTTPS or SSH)

**OR manually:**

```bash
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/element-android.git

# Push to your fork
git push -u origin develop
```

### 3️⃣ Enable GitHub Actions

1. Go to your fork: `https://github.com/YOUR_USERNAME/element-android`
2. Click **Actions** tab
3. Click **"I understand my workflows, go ahead and enable them"**
4. **Done!** Build starts automatically! ⏱️ (~40 min)

---

## 📥 Download APK

After build completes:

1. Go to **Actions** tab
2. Click the workflow run (top one)
3. Scroll to **Artifacts**
4. Download:
   - `chator-android-debug` ← **Use this for testing**
   - `chator-android-release` ← For distribution
   - `chator-android-bundle` ← For Play Store

---

## 📱 Install on Phone

### Debug APK (Recommended for testing)

```bash
# Connect phone via USB (enable USB debugging)
adb install vector-app-debug.apk
```

### Or manually:

1. Download APK to phone
2. Enable "Install from Unknown Sources"
3. Tap APK → Install
4. Open чатор app!

---

## 🎯 What's Changed

| Original Element | чатор Version |
|-----------------|---------------|
| App: Element Classic | App: **чатор** |
| Server: matrix.org | Server: **chator.k.vu** |
| Package: im.vector.app | Package: **im.chator.android** |
| Logo: Element | Logo: **чатор** |
| Room dir: matrix.org | Room dir: **chator.k.vu** |

---

## 💰 Cost

**GitHub Actions: FREE** (2000 minutes/month)
- Each build: ~40 minutes
- You get: ~50 builds/month
- More than enough! 🥞

**Google Play Store:** $25 one-time (optional)
- Only needed if publishing to Play Store
- Can distribute APK directly for FREE

---

## 🔧 Customize

### Change App Name

Edit: `vector-app/build.gradle`
```gradle
resValue "string", "app_name", "чатор"
```

### Change Default Server

Edit: `vector-config/src/main/res/values/config.xml`
```xml
<string name="matrix_org_server_url">https://chator.k.vu</string>
```

### Change Package Name

Edit: `vector-app/build.gradle`
```gradle
applicationId "im.chator.android"
```

Then push again - new build starts automatically!

---

## 🚨 Troubleshooting

**Build fails:**
- Check **Actions** tab → Click failed run → See logs
- Usually: Out of space, timeout, or dependency issue
- Try re-running workflow

**Can't push:**
- Make sure you forked first
- Check GitHub username is correct
- Use HTTPS if SSH not set up

**APK won't install:**
- Enable "Install from Unknown Sources"
- Try debug version first
- Check Android version (need 8.0+)

---

## 📞 Next Steps

After successful build:

1. ✅ Test on your phone
2. ✅ Share with friends (beta testers)
3. ✅ Set up Google Play Internal Testing (optional)
4. ✅ Publish to Play Store ($25, optional)
5. ✅ Build iOS version (need Mac)

---

## 📖 Full Documentation

- **Setup guide:** `GITHUB_ACTIONS_SETUP.md`
- **Push script:** `./PUSH_TO_GITHUB.sh`
- **Element docs:** https://github.com/element-hq/element-android/blob/develop/docs/development.md

---

## 🎉 You're Ready!

Run `./PUSH_TO_GITHUB.sh` and let GitHub do the work! 🥞

Questions? Check `GITHUB_ACTIONS_SETUP.md` for detailed instructions.
