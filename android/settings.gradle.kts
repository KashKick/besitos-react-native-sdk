pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        mavenLocal()
    }
}

rootProject.name = "BesitosAndroidSDK"

include(":besitos-android-sdk")
include(":sample")

project(":besitos-android-sdk").projectDir = file("besitos-android-sdk")
project(":sample").projectDir = file("sample")
