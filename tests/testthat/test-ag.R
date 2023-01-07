test_that("Silver searcher works", {
  skip_on_os("windows")
  target_path <- fs::dir_create(fs::file_temp("searcher"))
  withr::defer(fs::dir_delete(target_path))
  withr::local_dir(target_path)
  expect_equal(ag("search", "R"), 0)
})

test_that("Silver searcher works", {
  skip_on_os(c("mac", "linux"))
  expect_error(ag("search", "R"), "Not performing search because on Windows.")
})
