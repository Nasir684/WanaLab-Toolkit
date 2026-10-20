import 'dart:math';

class VarRhoEngine {
  static Map<String, dynamic> analyze(List<double> bx, List<double> by) {
    double meanX = bx.reduce((a,b)=>a+b) / bx.length;
    double meanY = by.reduce((a,b)=>a+b) / by.length;
    double varX = bx.map((x)=>pow(x-meanX,2)).reduce((a,b)=>a+b) / bx.length;
    double varY = by.map((y)=>pow(y-meanY,2)).reduce((a,b)=>a+b) / by.length;
    double Var = varX + varY;
    double Rho = 0;
    if (bx.length > 1) {
      double cov = 0;
      for(int i=0;i<bx.length;i++) cov += (bx[i]-meanX)*(by[i]-meanY);
      cov /= bx.length;
      double denom = sqrt(varX*varY);
      Rho = denom == 0 ? 0 : cov/denom;
    }
    bool pass = Var > 150 || Rho.abs() > 0.75;
    String type = Var > 500 ? "global EMI burst" : Rho.abs() > 0.8 ? "local hidden device" : "moderate pollution";
    return {"Var": Var, "Rho": Rho, "pass": pass, "type": type};
  }
}
