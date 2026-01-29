import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// 1. 키 정보를 읽어오는 로직 (맨 위에 배치)
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}

android {
    namespace = "com.devCha.do_dream_youth" // 기존 코드 유지
    compileSdk = flutter.compileSdkVersion

    defaultConfig {
        // 이 부분을 수정하거나 추가하세요
        applicationId = "com.devCha.do_dream_youth" // 본인의 패키지명
        minSdkVersion(24)
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // 2. 서명 설정 (문법이 약간 다릅니다)
    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        getByName("release") {
            // 3. 서명 적용
            signingConfig = signingConfigs.getByName("release")
            
            // 오류 방지를 위해 아래 두 줄은 기본값 유지 권장
            isMinifyEnabled = false
            isShrinkResources = false
            
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        // 1. 자바 컴파일 버전을 1.8에서 17로 변경
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        // 2. 코틀린 JVM 타겟도 17로 변경
        jvmTarget = "17"
    }
}
flutter {
    source = "../.."
}
