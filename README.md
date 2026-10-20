# WanaLab Toolkit — 12-in-1 Var-Rho Detector

> **One Engine, Twelve Tools.** 
> Built in Wana, Pakistan by WanaLab.

A single Flutter app that replaces 12 clone apps. Uses one statistical engine (Var-Rho) to detect electromagnetic anomalies for different real-world needs. Compliant with Google Play Repetitive Content Policy.

### 🔬 The Engine

File: `lib/var_rho_engine.dart`

```dart
Var = varX + varY
Rho = covariance(X,Y) / sqrt(varX*varY)
ALERT if Var > 150 or |Rho| > 0.75
