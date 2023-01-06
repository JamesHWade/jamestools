test_that("Silver searcher works", {
  target_path <- fs::dir_create(fs::file_temp("searcher"))
  withr::defer(fs::dir_delete(target_path))
  withr::local_dir(target_path)
  expect_equal(ag("search", "R"), 0)
})
