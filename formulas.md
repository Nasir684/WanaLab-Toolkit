# VarRho Engine - Formulas - Research Based - WanaLab Toolkit
# Author: Nasir Khan - Wana, South Waziristan
# GitHub: https://github.com/Nasir684/WanaLab-Toolkit

## VAR - Reactive Power - IEEE Std 1459-2010
Formulas:
- PF = kW / kVA (Power Factor)
- kVA = kW / PF (Apparent Power)
- θ = acos(PF) (Phase Angle in radians, convert to degrees: θ° = θ * 180/π)
- kVAR = kW * tan(θ) = kVA * sin(θ) (Reactive Power)
- VAR = V * I * sin(θ) (Single Phase)
- VAR 3-Phase = sqrt(3) * V * I * sin(θ)

Example: kW=10, PF=0.8 => kVA=12.5, θ=36.87°, kVAR=7.5
Used in: var_rho_calculator.json - VAR Calculator - Electrical Workshop

## Rho - Resistivity / Density
### 1. Material Resistivity: Rho = R * A / L
- R = Resistance (Ω)
- A = Cross-sectional Area (m²) = π * d² / 4
- L = Length (m)
- Rho = Resistivity (Ω.m)
- Example Copper: R=0.1Ω, A=0.000113m² (12mm dia), L=1m => Rho=1.13e-5 Ω.m
- Standard: Physics - Material Science

### 2. Soil Resistivity Wenner Method: Rho = 2 * π * a * R
- a = Electrode spacing (m)
- R = Measured Resistance (Ω)
- Rho = Soil Resistivity (Ω.m)
- Example: a=1m, R=10Ω => Rho=62.83 Ω.m
- Standard: ASTM G57-20 Wenner Method - Soil testing for earthing

### 3. Density: Rho = m / V
- m = Mass (kg)
- V = Volume (m³)
- Rho = Density (kg/m³)
- Example: m=10kg, V=0.01m³ => Rho=1000 kg/m³ (Water)
- Standard: Physics

## Steel Weight - IS 1786-2008
Formula: kg/m = Dia² / 162 (Dia in mm)
- Example: Dia 12mm => 144/162 = 0.888 kg/m

## Concrete Ratio - IS 456-2000
- 1:2:4 = Cement:Sand:Aggregate - Standard mix

## Wire Gauge - AWG/SWG - ASTM B258
- AWG to mm² conversion table

## Validation: See VALIDATION.md in same folder
## Engine: VarRho Engine v1.0 - Double precision Dart - Accurate - Research Based
## App: WanaLab Toolkit v1.7.2+48 - Powered by VarRho Engine - 40 Calculators
## GitHub: https://github.com/Nasir684/WanaLab-Toolkit - Open for Review
## Author: Nasir Khan - Made in Wana for Global - For All Religions Equal - Private - No Ads Ever
