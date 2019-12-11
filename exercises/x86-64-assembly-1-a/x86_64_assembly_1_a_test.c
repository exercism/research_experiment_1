#include "vendor/unity.h"

extern int str_isalpha(const char *str);

void setUp(void) {
}

void tearDown(void) {
}

void test_empty_string(void) {
    TEST_ASSERT_FALSE(str_isalpha(""));
}

void test_uppercase(void) {
    TEST_ASSERT_TRUE(str_isalpha("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
}

void test_uppercase_low_limit(void) {
    TEST_ASSERT_FALSE(str_isalpha("@ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
}

void test_uppercase_high_limit(void) {
    TEST_ASSERT_FALSE(str_isalpha("ABCDEFGHIJKLMNOPQRSTUVWXYZ["));
}

void test_lowercase(void) {
    TEST_ASSERT_TRUE(str_isalpha("abcdefghijklmnopqrstuvwxyz"));
}

void test_lowercase_low_limit(void) {
    TEST_ASSERT_FALSE(str_isalpha("`abcdefghijklmnopqrstuvwxyz"));
}

void test_lowercase_high_limit(void) {
    TEST_ASSERT_FALSE(str_isalpha("abcdefghijklmnopqrstuvwxyz{"));
}

void test_letters(void) {
    TEST_ASSERT_TRUE(str_isalpha("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_empty_string);
    RUN_TEST(test_uppercase);
    RUN_TEST(test_uppercase_low_limit);
    RUN_TEST(test_uppercase_high_limit);
    RUN_TEST(test_lowercase);
    RUN_TEST(test_lowercase_low_limit);
    RUN_TEST(test_lowercase_high_limit);
    RUN_TEST(test_letters);
    return UNITY_END();
}
