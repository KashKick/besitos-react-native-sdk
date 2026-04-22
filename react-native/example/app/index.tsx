import { Ionicons } from "@expo/vector-icons";
import * as Application from "expo-application";
import React from "react";
import {
  ActivityIndicator,
  Platform,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import type { OfferwallError } from "react-native-besitos-offerwall";
import { Offerwall } from "react-native-besitos-offerwall";
import { SafeAreaView } from "react-native-safe-area-context";

const Theme = {
  primary: "#EF0000",
  secondary: "#2E45EF",
  background: "#FFFFFF",
  bodyBackground: "#F9F9F9",
  text: "#1A1A1A",
  inputBorder: "#DAE0FE",
  debugBg: "#313033",
  tabBg: "#F0F2FF",
};

export default function MainScreen() {
  const [showWall, setShowWall] = React.useState(false);
  const [deviceId, setDeviceId] = React.useState("");

  const config = {
    apiVersion: "v1",
    partnerId: "CwI606dZ",
    userId: "user_123",
    subId: "tracking_001",
    deviceId,
    hideHeader: true,
    hideFooter: true,
  };

  React.useEffect(() => {
    const fetchId = async () => {
      try {
        if (Platform.OS === "android") {
          const id = await Application.getAndroidId();
          if (id) setDeviceId(id);
        }
      } catch (e) {
        console.warn("Could not fetch device ID", e);
      }
    };
    fetchId();
  }, []);

  if (showWall) {
    return (
      <Offerwall.Root config={config} onFullClose={() => setShowWall(false)}>
        <Offerwall.Content />
        <Offerwall.Loader>
          <View style={[StyleSheet.absoluteFill, styles.loaderContainer]}>
            <ActivityIndicator size="large" color={Theme.primary} />
          </View>
        </Offerwall.Loader>
        <Offerwall.Error>
          {(err: OfferwallError) => (
            <View style={[StyleSheet.absoluteFill, styles.errorContainer]}>
              <Text style={styles.errorText}>Error: {err.description}</Text>
              <TouchableOpacity
                onPress={() => setShowWall(false)}
                style={styles.button}
              >
                <Text style={styles.buttonText}>TRY AGAIN</Text>
              </TouchableOpacity>
            </View>
          )}
        </Offerwall.Error>
        <Offerwall.CloseButton>
          <Ionicons name="close" size={24} color={Theme.primary} />
        </Offerwall.CloseButton>
      </Offerwall.Root>
    );
  }

  return (
    <SafeAreaView
      style={styles.container}
      edges={["right", "left", "bottom", "top"]}
    >
      <View style={styles.center}>
        <Text style={styles.title}>Besitos SDK</Text>
        <Text style={styles.subtitle}>Click below to view offers</Text>

        <TouchableOpacity
          style={styles.offersButton}
          onPress={() => setShowWall(true)}
        >
          <Text style={styles.buttonText}>Offers</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Theme.background },
  center: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    padding: 20,
  },
  offersButton: {
    backgroundColor: Theme.primary,
    paddingHorizontal: 40,
    paddingVertical: 15,
    borderRadius: 30,
    marginTop: 30,
    shadowColor: Theme.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 5,
  },
  title: {
    fontSize: 32,
    fontWeight: "bold",
    color: Theme.text,
    marginBottom: 10,
  },
  subtitle: { fontSize: 16, color: "#666", marginBottom: 20 },
  form: {
    marginBottom: 20,
    backgroundColor: Theme.background,
    padding: 15,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: Theme.inputBorder,
  },
  label: {
    fontSize: 11,
    fontWeight: "bold",
    color: Theme.secondary,
    marginBottom: 5,
    textTransform: "uppercase",
  },
  input: {
    height: 44,
    borderWidth: 1,
    borderColor: "#E1E1E1",
    borderRadius: 8,
    paddingHorizontal: 12,
    marginBottom: 15,
    fontSize: 15,
    color: Theme.text,
    backgroundColor: Theme.bodyBackground,
  },
  readOnly: { backgroundColor: "#eee", color: "#888" },
  row: { flexDirection: "row", marginBottom: 5 },
  switchBox: {
    flex: 1,
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingRight: 10,
    marginBottom: 15,
  },
  switchLabel: { fontSize: 13, color: Theme.text, fontWeight: "600" },
  debugBox: {
    backgroundColor: Theme.debugBg,
    padding: 12,
    borderRadius: 8,
    marginBottom: 25,
    borderLeftWidth: 4,
    borderLeftColor: Theme.secondary,
  },
  debugLabel: {
    color: "#888",
    fontSize: 10,
    fontWeight: "900",
    marginBottom: 4,
  },
  debugText: {
    color: "#A0A0A0",
    fontSize: 11,
    fontFamily: Platform.OS === "ios" ? "Menlo" : "monospace",
  },
  button: {
    backgroundColor: Theme.primary,
    height: 56,
    borderRadius: 14,
    alignItems: "center",
    justifyContent: "center",
    shadowColor: Theme.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 5,
  },
  buttonDisabled: { backgroundColor: "#ccc", shadowOpacity: 0 },
  buttonText: {
    color: "#fff",
    fontSize: 17,
    fontWeight: "bold",
    letterSpacing: 0.5,
  },
  loaderContainer: {
    backgroundColor: "rgba(255,255,255,0.9)",
    justifyContent: "center",
    alignItems: "center",
  },
  errorContainer: {
    backgroundColor: Theme.background,
    justifyContent: "center",
    alignItems: "center",
    padding: 20,
  },
  errorText: {
    fontSize: 15,
    color: Theme.text,
    marginBottom: 20,
    textAlign: "center",
  },
});
