import Preferences
import SwiftUI

final class DebugSettings: ObservableObject {
    @AppStorage(\.animationACrashSuggestion) var animationACrashSuggestion
    @AppStorage(\.animationBCrashSuggestion) var animationBCrashSuggestion
    @AppStorage(\.animationCCrashSuggestion) var animationCCrashSuggestion
    @AppStorage(\.preCacheOnFileOpen) var preCacheOnFileOpen
    @AppStorage(\.useCustomScrollViewWorkaround) var useCustomScrollViewWorkaround
    @AppStorage(\.triggerActionWithAccessibilityAPI) var triggerActionWithAccessibilityAPI
    @AppStorage(\.alwaysAcceptSuggestionWithAccessibilityAPI)
    var alwaysAcceptSuggestionWithAccessibilityAPI
    @AppStorage(\.enableXcodeInspectorDebugMenu) var enableXcodeInspectorDebugMenu
    @AppStorage(\.disableFunctionCalling) var disableFunctionCalling
    @AppStorage(\.disableGitHubCopilotSettingsAutoRefreshOnAppear)
    var disableGitHubCopilotSettingsAutoRefreshOnAppear
    @AppStorage(\.useUserDefaultsBaseAPIKeychain) var useUserDefaultsBaseAPIKeychain
    init() {}
}

struct DebugSettingsView: View {
    @StateObject var settings = DebugSettings()

    var body: some View {
        ScrollView {
            Form {
                Toggle(isOn: $settings.animationACrashSuggestion) {
                    Text("Enable animation A")
                }
                Toggle(isOn: $settings.animationBCrashSuggestion) {
                    Text("Enable animation B")
                }
                Toggle(isOn: $settings.animationCCrashSuggestion) {
                    Text("Enable widget breathing animation")
                }
                Toggle(isOn: $settings.preCacheOnFileOpen) {
                    Text("Cache editor information on file open")
                }
                Toggle(isOn: $settings.useCustomScrollViewWorkaround) {
                    Text("Use custom scroll view workaround for smooth scrolling")
                }
                Toggle(isOn: $settings.triggerActionWithAccessibilityAPI) {
                    Text("Trigger command with AccessibilityAPI")
                }
                Group {
                    Toggle(isOn: $settings.alwaysAcceptSuggestionWithAccessibilityAPI) {
                        Text("Always accept suggestion with Accessibility API")
                    }
                    Toggle(isOn: $settings.enableXcodeInspectorDebugMenu) {
                        Text("Enable Xcode inspector debug menu")
                    }
                    Toggle(isOn: $settings.disableFunctionCalling) {
                        Text("Disable function calling for chat feature")
                    }
                    Toggle(isOn: $settings.disableGitHubCopilotSettingsAutoRefreshOnAppear) {
                        Text("Disable GitHub Copilot settings auto refresh status on appear")
                    }
                    Toggle(isOn: $settings.useUserDefaultsBaseAPIKeychain) {
                        Text("Store API keys in UserDefaults")
                    }
                    
                    Button("Reset Migration Version to 0") {
                        UserDefaults.shared.set(nil, forKey: "OldMigrationVersion")
                    }
                    
                    Button("Reset 0.23.0 migration") {
                        UserDefaults.shared.set("239", forKey: "OldMigrationVersion")
                        UserDefaults.shared.set(nil, forKey: "MigrateTo240Finished")
                        UserDefaults.shared.set(nil, forKey: "ChatModels")
                        UserDefaults.shared.set(nil, forKey: "EmbeddingModels")
                    }
                }
            }
            .padding()
        }
    }
}

struct DebugSettingsView_Preview: PreviewProvider {
    static var previews: some View {
        DebugSettingsView()
    }
}


