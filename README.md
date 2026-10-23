# WanaLab Toolkit

WanaLab Toolkit is a research-oriented mobile platform for engineering estimation, EMI screening, detector analysis, and scientific workflow support, designed for continued evolution through 2037. The project combines practical utility tools with workshop-style calculations and VarRho-inspired research modules to assist in exploratory analysis, technical screening, and academic workflows. It is built to support early-stage estimation, scenario planning, structured scientific reporting, and future-facing engineering research while maintaining a clear distinction between research-based approximation and certified measurement, validation, and formal compliance systems.

The application is specifically designed to support scholars, researchers, and technical users who need to:
- estimate exposure and shielding conditions
- document assumptions and scientific notes
- compare multiple scenarios
- export results in shareable formats
- preserve local research records without external dependencies
- collaborate through direct result sharing without submitting personal or research data to a remote server

All result generation is performed locally on the device. There is no login, no subscription, no cloud account, and no external access to user data. The app does not collect personal information, does not require user registration, and does not store research results on any remote system. Users can install the app once and use it immediately without ongoing fees or account management. Results can be exported as JSON, CSV, text, or shared directly through the device’s native share function for academic review, collaboration, and reporting.

This project is intended for:
- engineering and workshop calculations
- EMI and environmental screening
- detector and sensor risk estimation
- academic and exploratory scientific workflows
- structured technical reporting and data export

The application emphasizes transparency, assumptions, and reproducibility, ensuring outputs remain useful for research and design review while avoiding overstatement of precision or regulatory authority. It is positioned as a practical research-support platform rather than a replacement for calibrated instruments, formal testing, or safety-critical validation processes.

## Privacy-first product principles
- No login required
- No subscription required
- One-time installation only
- No cloud storage of user data
- No tracking, analytics, or third-party monitoring
- No personal data collection
- No remote access to user records
- Export and share only through the device’s native sharing system
- Local-only calculation and data handling

## Features
- Direct-open dashboard
- Mobile sensor integration for GPS and environment estimation
- EMI and environmental screening
- Detector-specific risk estimation
- Research-oriented data export
- Local-only privacy model
- Modern glass-water interface
- One-tap access to tools

## Project structure
```text
lib/
  main.dart
  features/
    dashboard_screen.dart
    gps_screen.dart
    emi_screen.dart
    emi_sensor_screen.dart
    varrho_research_screen.dart
    workshop_screen.dart
    settings_screen.dart
    about_screen.dart
    core_screen.dart
    baby_screen.dart
    gym_screen.dart
