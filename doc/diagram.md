
```plantuml
package main {
    component "app" as app #azure
}

node "feature A" {
    component "featureA" as featureA_framework #mistyrose
    component "featureASandboxApp" as featureA_sandboxapp #azure

    folder featureA as featureA_dir {
        [src] as featureA_src
    }

    folder featureASandboxApp as featureASandboxApp_dir {
        folder src as featureASandboxApp_src {
            [AppDelegate.swift]
            [*Preview.swift]
        }
        folder res {
        }
    }
}

app -[#purple]-> featureA_framework
note on link #lavender
dependency
end note
featureA_framework <-[#purple]- featureA_sandboxapp
note on link #lavender
dependency
end note
featureA_framework --> featureA_dir
featureA_sandboxapp --> featureA_dir
featureA_sandboxapp --> featureASandboxApp_dir

note right of app
application target of main iOS app
end note

note right of featureA_framework
framework target of feature A
end note

note right of featureA_sandboxapp
application target for Xcode Preview of featureA
end note
```

When developing feature A, only the `featureASandboxApp` can be used for development, so that development can proceed efficiently without involving source builds of other features.
