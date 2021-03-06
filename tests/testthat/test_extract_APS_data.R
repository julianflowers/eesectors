context("extract_APS_data works as expected")

testspss <- file.path('testdata', 'APS_test.sav')
reference <- file.path('testdata', 'test_reference_APS.Rds')

test_that(
  "extract_APS_data can extract data from a dummy spss file in the correct format",
  {
    #test that the output spss file matches the expected format
    APS <- eesectors::extract_APS_data(testspss)
    APS_reference <- readRDS(reference)
    expect_equal(colnames(APS),colnames(APS_reference))
    expect_equal_to_reference(APS, reference)
    expect_equal(APS,APS_reference)
    expect_is(APS, c('data.frame', 'tbl', 'tbl_df'))

  }
)
