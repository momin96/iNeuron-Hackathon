plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    compileSdk = 32
    defaultConfig {
        applicationId = "com.nasir.nazsay.android"
        minSdk = 24
        targetSdk = 32
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
        kotlinOptions {
            jvmTarget = "1.8"
        }

    buildFeatures {
        compose = true
    }

    kotlinOptions() {
        jvmTarget = "1.8"
    }

    packagingOptions {
        resources {
            excludes.add("META-INF/DEPENDENCIES")
        }
    }
}

dependencies {
//

    val composeVersion = "1.1.0-beta01"

    implementation("androidx.core:core-ktx:1.7.0")
    implementation ("androidx.compose.ui:ui:$composeVersion")
    implementation ("androidx.compose.material:material:$composeVersion")
    implementation ("androidx.compose.ui:ui-tooling-preview:$composeVersion")
//    implementation ('androidx.lifecycle:lifecycle-runtime-ktx:2.3.1')
//    implementation ('androidx.activity:activity-compose:1.3.1')
//    testImplementation ('junit:junit:4.13.2')
//    androidTestImplementation ('androidx.test.ext:junit:1.1.3')
//    androidTestImplementation ('androidx.test.espresso:espresso-core:3.4.0')
    androidTestImplementation ("androidx.compose.ui:ui-test-junit4:$composeVersion")
    debugImplementation ("androidx.compose.ui:ui-tooling:$composeVersion")
    debugImplementation ("androidx.compose.ui:ui-test-manifest:$composeVersion")

//    val composeVersion = "1.0.0-alpha08"
//    implementation("androidx.compose.ui:ui:$composeVersion")
//    implementation("androidx.compose.material:material:$composeVersion")
//    implementation("androidx.compose.ui:ui-tooling:$composeVersion")
//
//    implementation(project(":shared"))
//    implementation("com.google.android.material:material:1.4.0")
//    implementation("androidx.appcompat:appcompat:1.3.1")
//    implementation("androidx.constraintlayout:constraintlayout:2.1.0")
}