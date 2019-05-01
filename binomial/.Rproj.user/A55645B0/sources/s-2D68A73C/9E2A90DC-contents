
context("test binomial functions")

# test bin_choose() function
test_that("test that bin_choose works",{
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 3), 10)
  expect_error(bin_choose('a', 0.3))
  expect_error(bin_choose(3,4), "k cannot be greater than n")
  expect_length(bin_choose(5, 0),1)
  expect_is(bin_choose(5, 0),'numeric')
})




# test bin_probability function
test_that("test that bin_choose works",{
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_equal(bin_probability(55, 100, 0.45),0.01075277)
  expect_error(bin_probability('a', 0.3))
  expect_length(bin_probability(2, 5, 0.5),1)
  expect_length(bin_probability(0:3, 5, 0.5),4)
  expect_is(bin_probability(2, 5, 0.5),'numeric')
})


# test bin_distribution function
test_that("test that bin_distribution works",{
  expect_is(bin_distribution(5,0.5), 'bindis')
  expect_is(bin_distribution(5,0.5), 'data.frame')
  expect_error(bin_distribution(-4,0.5))
  expect_length(bin_distribution(5,0.5),2)
})


# test bin_cumulative function
test_that("test that bin_cumulative works",{
  expect_is(bin_cumulative(5,0.5), 'bincum')
  expect_is(bin_cumulative(5,0.5), 'data.frame')
  expect_error(bin_cumulative(-4,0.5))
  expect_length(bin_cumulative(5,0.5),3)
})

