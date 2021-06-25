#include "vendor/unity.h"

extern int str_isidentifier(const char *str);

void setUp(void) {
}

void tearDown(void) {
}

void test_empty_string(void) {
    TEST_ASSERT_FALSE(str_isidentifier(""));
}

void test_uppercase(void) {
    TEST_ASSERT_TRUE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
}

void test_uppercase_low_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZ@"));
}

void test_uppercase_high_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZ["));
}

void test_lowercase(void) {
    TEST_ASSERT_TRUE(str_isidentifier("abcdefghijklmnopqrstuvwxyz"));
}

void test_lowercase_low_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("abcdefghijklmnopqrstuvwxyz`"));
}

void test_lowercase_high_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("abcdefghijklmnopqrstuvwxyz{"));
}

void test_letters(void) {
    TEST_ASSERT_TRUE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
}

void test_underscore(void) {
    TEST_ASSERT_TRUE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_"));
}

void test_underscore_low_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_^"));
}

void test_digits(void) {
    TEST_ASSERT_TRUE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789"));
}

void test_digits_low_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789/"));
}

void test_digits_high_limit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789:"));
}

void test_letters_underscore_digits(void) {
    TEST_ASSERT_TRUE(str_isidentifier("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789"));
}

void test_first_letter_digit(void) {
    TEST_ASSERT_FALSE(str_isidentifier("0ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789"));
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
    RUN_TEST(test_underscore);
    RUN_TEST(test_underscore_low_limit);
    RUN_TEST(test_digits);
    RUN_TEST(test_digits_low_limit);
    RUN_TEST(test_digits_high_limit);
    RUN_TEST(test_letters_underscore_digits);
    RUN_TEST(test_first_letter_digit);
    return UNITY_END();
}
