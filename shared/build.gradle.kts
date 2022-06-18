plugins {
    kotlin("multiplatform")
    kotlin("native.cocoapods")
    id("com.android.library")
}

version = "1.0"

kotlin {
    android()
    iosX64()
    iosArm64()
    iosSimulatorArm64()

    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        ios.deploymentTarget = "14.1"
        podfile = project.file("../iosApp/Podfile")
        framework {
            baseName = "shared"
        }
    }
    
    sourceSets {
        val commonMain by getting {
            dependencies {
               // implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.3.2")

                val coroutine_version = "1.3.8"
                val moko_mvvm_version = "0.11.0"
                val serializer_version = "0.20.0"
                val kodeinVersion = "6.5.5"

                api ("org.jetbrains.kotlin:kotlin-stdlib-common")

                // COROUTINES
                implementation ("org.jetbrains.kotlinx:kotlinx-coroutines-core-common:$coroutine_version")

                // MOKO - MVVM
                implementation ("dev.icerock.moko:mvvm:$moko_mvvm_version")

                // SERIALIZATION
                implementation ("org.jetbrains.kotlinx:kotlinx-serialization-runtime-common:$serializer_version")

                // KODE IN
//                implementation ("org.kodein.di:kodein-di-core:$kodeinVersion")
//                implementation ("org.kodein.di:kodein-di-erased:$kodeinVersion")

                // FIRE STORE
                implementation ("co.touchlab:firestore:0.2.5")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }

        val androidAndroidTestRelease by getting
        val androidTestFixtures by getting
        val androidTestFixturesDebug by getting
        val androidTestFixturesRelease by getting

        val androidMain by getting {
            dependencies {
                val kotlin_version = "1.5.1"
                val coroutine_version = "1.6.1"
                implementation ("org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version")
                implementation ("org.jetbrains.kotlin:kotlin-stdlib-common:$kotlin_version")
                implementation ("org.jetbrains.kotlinx:kotlinx-coroutines-android:$coroutine_version")


                // MOKO - MVVM
//                implementation "androidx.lifecycle:lifecycle-extensions:$androidx_lifecycle_version"
//
//                // SERIALIZATION
//                implementation "org.jetbrains.kotlinx:kotlinx-serialization-runtime:$serializer_version"
//
//                // FIREBASE
//                implementation "com.google.firebase:firebase-core:$firebaseFireStoreVersion"
//                implementation "com.google.firebase:firebase-firestore:$firebaseFireStoreVersion"

            }
        }
        val androidTest by getting {
            dependsOn(androidAndroidTestRelease)
            dependsOn(androidTestFixtures)
            dependsOn(androidTestFixturesDebug)
            dependsOn(androidTestFixturesRelease)
        }
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }
}

android {
    compileSdk = 32
    sourceSets["main"].manifest.srcFile("src/androidMain/AndroidManifest.xml")
    defaultConfig {
        minSdk = 21
        targetSdk = 32
    }
}
dependencies {
    implementation("androidx.lifecycle:lifecycle-viewmodel-ktx:2.4.1")
}
