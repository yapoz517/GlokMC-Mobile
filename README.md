# GlokMC Mobile (PojavLauncher tabanlı)

## APK nasıl çıkar
1. GitHub'da yeni depo aç, bu klasörün içindekileri yükle.
2. Actions > "GlokMC Mobile APK" > Run workflow.
3. Bitince Artifacts > GlokMC-APK indir, telefona kur.
(Derleme hata verirse: PojavLauncher'ın kendi `build.yml` dosyasındaki JRE/native adımlarını workflow'a ekle.)

## Ne yapıldı
- Uygulama adı GlokMC, simge assets/icon.png'den.
- PojavLauncher zaten tüm Minecraft sürümlerini, Fabric/Forge/Quilt kurulumunu, mod ve Microsoft/çevrimdışı girişi destekler.

## Telefonda elle yapılacaklar
- Çoklu Oyuncu > sunucu ekle: GlokMC.aternos.me : 54356
- Mod: Fabric kur, jar'ları mods klasörüne koy.

## Masaüstünden taşınmayanlar
Electron launcher (main.js, index.html) Android'de çalışmaz; Discord durumu, otomatik /login, remote.json haberleri ve GlokMC Client modu (Minecraft 26.2 + Java 25 ister) mobilde yok.

## Lisans
PojavLauncher LGPL-3.0: değiştirilmiş kaynak kodunu yayınlamak zorundasın.
