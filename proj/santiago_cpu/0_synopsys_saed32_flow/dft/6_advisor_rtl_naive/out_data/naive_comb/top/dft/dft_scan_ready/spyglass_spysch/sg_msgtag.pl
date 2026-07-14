################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(363,63);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyCacheTagValuesFromBatch(["pe_crossprobe_tag"]);
spyParseTextMessageTagFile("./out_data/naive_comb/top/dft/dft_scan_ready/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(40,"./out_data/naive_comb/top/dft/dft_scan_ready/spyglass.vdb");

1;
