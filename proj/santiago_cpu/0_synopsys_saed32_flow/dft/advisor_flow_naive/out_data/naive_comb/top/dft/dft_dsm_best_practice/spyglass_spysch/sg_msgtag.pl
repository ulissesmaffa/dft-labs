################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(122,47);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyParseTextMessageTagFile("./out_data/naive_comb/top/dft/dft_dsm_best_practice/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(26,"./out_data/naive_comb/top/dft/dft_dsm_best_practice/spyglass.vdb");

1;
