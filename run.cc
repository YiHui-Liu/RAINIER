#include <TInterpreter.h>
#include <TROOT.h>

void run() {
  gROOT->ProcessLine(".L Analyze.C");
  gROOT->ProcessLine("Analyze()");
  gROOT->ProcessLine("AnalyzeDRTSC()");
}