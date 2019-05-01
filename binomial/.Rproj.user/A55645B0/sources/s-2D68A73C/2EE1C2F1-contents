
context("test auxiliary functions")

# test aux_mean() function
test_that("test that aux_mean works",{
  expect_equal(aux_mean(10, 0.5), 5)
  expect_equal(aux_mean(100, 0.3), 30)
  expect_equal(aux_mean(1000, 0.1), 100)
  expect_error(aux_mean('a', 0.3))
  expect_length(aux_mean(10,0.5),1)
  expect_is(aux_mean(10,0.5),'numeric')
})


# test aux_variance() function
test_that("test that aux_variance works",{
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(100, 0.3), 21)
  expect_equal(aux_variance(1000, 0.1), 90)
  expect_error(aux_variance('a', 0.3))
  expect_length(aux_variance(10,0.5),1)
})


# test aux_mode() function
test_that("test that aux_mode works",{
  expect_equal(aux_mode(10, 0.5), 5)
  expect_equal(aux_mode(100, 0.3), 30)
  expect_equal(aux_mode(1000, 0.1), 100)
  expect_error(aux_mode('a', 0.3))
  expect_length(aux_mode(10, 0.5),1)
  expect_length(aux_mode(11, 0.5),2)
})


# test aux_skewness() function
test_that("test that aux_skewness works",{
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(signif(aux_skewness(10, 0.3),3), signif(0.2760262,3))
  expect_error(aux_skewness('a', 0.3))
  expect_length(aux_skewness(10, 0.3),1)
})


# test aux_kurtosis() function
test_that("test that aux_kurtosis works",{
  expect_equal(aux_kurtosis(10, 0.5),-0.2)
  expect_equal(signif(aux_kurtosis(10, 0.3),3), signif(-0.1238095,3))
  expect_error(aux_kurtosis('a', 0.3))
  expect_length(aux_kurtosis(10, 0.3),1)
})

