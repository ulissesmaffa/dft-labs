################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(76,47);
spyCacheTagValuesFromBatch(["Async_02_capture_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Async_07_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Async_08_CSV_TAG"]);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Diagnose_testclock_CSV_TAG"]);
spyParseTextMessageTagFile("./out_data/santiago/top_santiago_cpu/dft/dft_best_practice/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(60,"./out_data/santiago/top_santiago_cpu/dft/dft_best_practice/spyglass.vdb");

1;
