# R CMD check
if (!ci_has_env("PARAMTEST")) {
  do_package_checks()

  #do_drat("mlr3learners/mlr3learners.drat")
} else {
  # PARAMTEST
  get_stage("script") %>%
    add_code_step(testthat::test_dir(system.file("paramtest", package = "mlr3learners.lightgbm"),
      stop_on_failure = TRUE))
}
