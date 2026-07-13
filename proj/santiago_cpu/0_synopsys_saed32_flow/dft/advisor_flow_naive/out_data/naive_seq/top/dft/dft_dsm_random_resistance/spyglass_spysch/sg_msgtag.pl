################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(122,47);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyCacheTagValuesFromBatch(["DFT_DSM_RRF_TP_TAG"]);
spyParseTextMessageTagFile("./out_data/naive_seq/top/dft/dft_dsm_random_resistance/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(19,"./out_data/naive_seq/top/dft/dft_dsm_random_resistance/spyglass.vdb");

1;
