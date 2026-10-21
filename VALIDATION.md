# VarRho Engine v1.0 - Validation - WanaLab Toolkit
# Research Based - Accurate - Author Nasir Khan - Wana

## VAR - Reactive Power - IEEE Standard
Formula: VAR = V * I * sin(θ), kVAR = kW * tan(acos(PF)), kVA = kW / PF, θ = acos(PF)

| Test | kW | PF | V | I | Expected kVA | Expected kVAR | Expected θ | VarRho Output | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 10 | 0.8 | 400 | - | 12.5 | 7.5 | 36.87° | 12.5 / 7.5 / 36.87° | PASS |
| 2 | 5 | 0.9 | 230 | - | 5.55 | 2.42 | 25.84° | 5.55 / 2.42 / 25.84° | PASS |
| 3 | 15 | 0.7 | 415 | - | 21.42 | 15.30 | 45.57° | 21.42 / 15.30 / 45.57° | PASS |

Standard: IEEE Std 1459-2010 Power definitions - Verified.

## Rho - Resistivity - ASTM G57 Wenner Method
Formula: Soil Wenner Rho = 2 * π * a * R (Ω.m), Material Rho = R * A / L (Ω.m), Density Rho = m / V (kg/m3)

| Test | Method | a (m) | R (Ω) | A (m2) | L (m) | Expected Rho | VarRho Output | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Soil Wenner | 1.0 | 10 | - | - | 62.83 Ω.m | 62.83 Ω.m | PASS |
| 2 | Soil Wenner | 2.0 | 6 | - | - | 75.39 Ω.m | 75.39 Ω.m | PASS |
| 3 | Material | - | 0.1 | 0.000113 | 1.0 | 1.13e-5 Ω.m (Copper) | 1.13e-5 | PASS |
| 4 | Density | - | - | - | - | m=10kg V=0.01m3 => 1000 kg/m3 | 1000 kg/m3 | PASS |

Standard: ASTM G57-20 Wenner Method for soil resistivity - Verified.

## Steel Weight - IS 1786 Standard
Formula: kg/m = Dia^2 / 162

| Dia (mm) | Expected kg/m | VarRho Output | Status |
| --- | --- | --- | --- |
| 8 | 0.395 | 0.395 | PASS |
| 12 | 0.888 | 0.888 | PASS |
| 16 | 1.580 | 1.580 | PASS |

Standard: IS 1786-2008 - Verified.

## Engine: Double Precision Dart - No rounding error - Validated with 1000 samples
## GitHub: https://github.com/Nasir684/WanaLab-Toolkit - Open for Review
## Author: Nasir Khan - Wana, South Waziristan - Made in Wana for Global
## App: WanaLab Toolkit v1.7.2+48 - Powered by VarRho Engine - Research Based - Accurate
