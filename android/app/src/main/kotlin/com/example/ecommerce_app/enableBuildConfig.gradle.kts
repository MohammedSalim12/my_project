import com.android.build.gradle.AppExtension
import com.android.build.gradle.LibraryExtension

plugins {
    id("base")
}

gradle.projectsEvaluated {
    rootProject.allprojects.forEach { project ->
        project.plugins.withId("com.android.application") {
            val ext = project.extensions.getByType(AppExtension::class.java)
            ext.buildFeatures.apply {
                buildConfig = true
            }
        }
        project.plugins.withId("com.android.library") {
            val ext = project.extensions.getByType(LibraryExtension::class.java)
            ext.buildFeatures.apply {
                buildConfig = true
            }
        }
    }
}
