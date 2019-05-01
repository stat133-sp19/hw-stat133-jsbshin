
context("test checker functions")

# test check_prob() function
test_that("test that check_prob works",{
  expect_true(check_prob(0.5))
  expect_length(check_prob(0.5),1)
  expect_error(check_prob(2), 'invalid prob value')
  expect_error(check_prob(-1), 'invalid prob value')
}
)



# test check_trials() function

test_that("test that check_trials works",{
  expect_true(check_trials(7))
  expect_length(check_trials(7),1)
  expect_error(check_trials(3.5), 'invalid trials value')
  expect_error(check_trials(-1), 'invalid trials value')
}
)



# test check_success() function

test_that("test that check_success works",{
  expect_true(check_success(4,9))
  expect_length(check_success(3,5),1)
  expect_error(check_success(10,9),'success can not be greater than trials')
  expect_error(check_success(2.3,3), 'invalid success value')

}
)
