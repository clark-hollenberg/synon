#################################
# Synonymy testing

data = read.csv("../RankingProjects/PlantRanking/all_plant_records_SEINet_iNat_Biotics_20250106_RARECAT_test_simp.csv")


unique_df <- read.csv("_SEINet_unique_df_testing.csv")


write.csv(unique_df, "sample_input.csv", row.names=FALSE)

checklist <- read.csv("../RankingProjects/SEINet/BioticsElementsPlants.csv")

user_lut <- read.csv("sample_user_LUT.csv")

translated_df <- synonymize(
  unique_df,
  name_col = "scientificName",
  checklist = checklist,
  checklist_name_col = "SNAME",
  synonym_LUTs = list(user_lut),
  synonym_sources = c("NatureServe", "SEINet", "USDA", "WCVP"),
  synonym_sources_rerun = TRUE,
  fuzzy = FALSE,
  wcvp_rerun = FALSE,
  ssp_mods_checklist = TRUE,
  ssp_mods_input = TRUE,
  cross_check = TRUE
)

write.csv(translated_df, "translation_results_example.csv", row.names = FALSE)

