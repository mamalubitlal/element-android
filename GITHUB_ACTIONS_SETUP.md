# чатор Android - GitHub Actions Setup

## 🚀 Quick Setup (5 minutes)

### Step 1: Create Your Fork

1. Go to https://github.com/element-hq/element-android
2. Click **Fork** (top right)
3. Create fork under your GitHub account
4. Copy your fork URL: `https://github.com/YOUR_USERNAME/element-android.git`

### Step 2: Push чатор Code to Your Fork

```bash
# Navigate to the cloned repo
cd /mnt/data/openclaw/workspace/.openclaw/workspace/chator-android-temp

# Remove the original remote
git remote remove origin 2>/dev/null || true

# Add YOUR fork as origin (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/element-android.git

# Or use SSH if you have SSH keys set up:
# git remote add origin git@github.com:YOUR_USERNAME/element-android.git

# Add all changes
git add -A

# Commit
git commit -m "чатор: Custom branding for Russian teens messenger

- App name: чатор
- Default server: https://chator.k.vu
- Package: im.chator.android
- Logo: чатор branding
- Room directory: chator.k.vu"

# Push to your fork
git push -u origin main
# Or if your default branch is called 'master':
# git push -u origin master
```

### Step 3: Enable GitHub Actions

1. Go to your fork on GitHub: `https://github.com/YOUR_USERNAME/element-android`
2. Click **Actions** tab
3. If you see "I understand my workflows, go ahead and enable them" → Click it
4. GitHub Actions is now enabled! ✅

### Step 4: Trigger First Build

**Option A: Push triggers build automatically**
- Just push any commit and build starts

**Option B: Manual trigger**
1. Go to **Actions** tab
2. Click **чатор Android Build** workflow
3. Click **Run workflow**
4. Select branch → **Run workflow**

### Step 5: Download APK

1. Wait for build to complete (~30-50 min first time)
2. Click the workflow run
3. Scroll to **Artifacts** section
4. Download:
   - `chator-android-debug` - For testing
   - `chator-android-release` - For distribution
   - `chator-android-bundle` - For Play Store

---

## 📊 Build Times

| Build Type | Time | Size |
|------------|------|------|
| Debug APK | ~30-40 min | ~120 MB |
| Release APK | ~35-45 min | ~100 MB |
| AAB Bundle | ~35-45 min | ~90 MB |

**First build** takes longer (downloads all dependencies).

**Subsequent builds** are faster (cached).

---

## 💰 GitHub Actions Free Tier

**Included FREE:**
- ✅ 2000 minutes/month
- ✅ 500 MB artifact storage
- ✅ Unlimited public repos
- ✅ Unlimited collaborators

**чатор build time:** ~40 minutes
**You can build:** ~50 times per month for FREE!

---

## 🔧 Customization

### Change Build Frequency

Edit `.github/workflows/build.yml`:

```yaml
# Add scheduled builds (every Monday at 9 AM UTC)
on:
  push:
    branches: [ main ]
  schedule:
    - cron: '0 9 * * 1'  # Every Monday 9 AM
  workflow_dispatch:
```

### Add Auto-Release

Add this step to upload releases automatically:

```yaml
- name: Create Release
  uses: softprops/action-gh-release@v1
  if: startsWith(github.ref, 'refs/tags/')
  with:
    files: |
      vector-app/build/outputs/apk/release/*.apk
      vector-app/build/outputs/bundle/release/*.aab
```

### Enable Build Matrix

Build for multiple Android versions:

```yaml
strategy:
  matrix:
    android-api: [30, 31, 32, 33, 34]
```

---

## 🚨 Troubleshooting

**Build fails with "No space left on device":**
```yaml
# Add this step to clean up space
- name: Free up space
  run: |
    sudo rm -rf /usr/share/dotnet
    sudo rm -rf /opt/ghc
    sudo rm -rf "/usr/local/share/boost"
```

**Build times out:**
- Increase timeout in workflow
- Or use `actions/cache` for better Gradle caching

**Artifact download fails:**
- Artifacts expire after 30 days
- Download immediately after build

**Need more minutes?**
- GitHub Pro: $4/month (3000 min)
- GitHub Team: $4/user/month (unlimited for public repos)

---

## 📱 Testing the APK

### Install on Device

```bash
# Enable USB debugging on Android phone
# Connect via USB
adb install vector-app-debug.apk
```

### Install via QR Code

1. Upload APK to a file hosting service
2. Generate QR code for download link
3. Scan on phone → Install

### Distribute to Testers

**Option A: Google Play Internal Testing**
1. Upload AAB to Play Console
2. Add tester emails
3. They get link in 1-2 hours

**Option B: Direct APK**
1. Share APK file directly
2. Users enable "Install from Unknown Sources"
3. Install APK

**Option C: Firebase App Distribution**
1. Connect GitHub to Firebase
2. Auto-deploy on every build
3. Testers get email notifications

---

## 🎯 Next Steps

After first successful build:

1. ✅ Test the APK on your device
2. ✅ Share with beta testers
3. ✅ Set up Firebase App Distribution (optional)
4. ✅ Create Google Play Developer account ($25)
5. ✅ Upload AAB to Play Store

---

## 📞 Support

**Element Android:** https://github.com/element-hq/element-android/issues
**GitHub Actions:** https://docs.github.com/en/actions
**чатор:** Your GitHub repo issues

Удачи! 🥞
