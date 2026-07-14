################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(363,63);
spyCacheTagValuesFromBatch(["Async_07_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Async_08_CSV_TAG"]);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Diagnose_testclock_CSV_TAG"]);
spyCacheTagValuesFromBatch(["pe_crossprobe_tag"]);
spyParseTextMessageTagFile("./out_data/santiago/top_santiago_cpu/dft/dft_scan_ready/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(51,"./out_data/santiago/top_santiago_cpu/dft/dft_scan_ready/spyglass.vdb");

1;
