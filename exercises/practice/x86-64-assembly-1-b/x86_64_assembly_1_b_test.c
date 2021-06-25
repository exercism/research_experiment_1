#include "vendor/unity.h"

enum color {
    RED,
    ORANGE,
    YELLOW,
    GREEN,
    BLUE,
    INDIGO,
    VIOLET
};

extern const char *color_name(enum color c);

void setUp(void) {
}

void tearDown(void) {
}

void test_red(void) {
    TEST_ASSERT_EQUAL_STRING("RED", color_name(RED));
}

void test_orange(void) {
    TEST_ASSERT_EQUAL_STRING("ORANGE", color_name(ORANGE));
}

void test_yellow(void) {
    TEST_ASSERT_EQUAL_STRING("YELLOW", color_name(YELLOW));
}

void test_green(void) {
    TEST_ASSERT_EQUAL_STRING("GREEN", color_name(GREEN));
}

void test_blue(void) {
    TEST_ASSERT_EQUAL_STRING("BLUE", color_name(BLUE));
}

void test_indigo(void) {
    TEST_ASSERT_EQUAL_STRING("INDIGO", color_name(INDIGO));
}

void test_violet(void) {
    TEST_ASSERT_EQUAL_STRING("VIOLET", color_name(VIOLET));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_red);
    RUN_TEST(test_orange);
    RUN_TEST(test_yellow);
    RUN_TEST(test_green);
    RUN_TEST(test_blue);
    RUN_TEST(test_indigo);
    RUN_TEST(test_violet);
    return UNITY_END();
}
