#include "vendor/unity.h"

#define BUFSIZE 256

enum color {
    RED,
    ORANGE,
    YELLOW,
    GREEN,
    BLUE,
    INDIGO,
    VIOLET
};

extern void color_name(char *buf, enum color c);

void setUp(void) {
}

void tearDown(void) {
}

void test_red(void) {
    char buf[BUFSIZE];

    color_name(buf, RED);
    TEST_ASSERT_EQUAL_STRING("RED", buf);
}

void test_orange(void) {
    char buf[BUFSIZE];

    color_name(buf, ORANGE);
    TEST_ASSERT_EQUAL_STRING("ORANGE", buf);
}

void test_yellow(void) {
    char buf[BUFSIZE];

    color_name(buf, YELLOW);
    TEST_ASSERT_EQUAL_STRING("YELLOW", buf);
}

void test_green(void) {
    char buf[BUFSIZE];

    color_name(buf, GREEN);
    TEST_ASSERT_EQUAL_STRING("GREEN", buf);
}

void test_blue(void) {
    char buf[BUFSIZE];

    color_name(buf, BLUE);
    TEST_ASSERT_EQUAL_STRING("BLUE", buf);
}

void test_indigo(void) {
    char buf[BUFSIZE];

    color_name(buf, INDIGO);
    TEST_ASSERT_EQUAL_STRING("INDIGO", buf);
}

void test_violet(void) {
    char buf[BUFSIZE];

    color_name(buf, VIOLET);
    TEST_ASSERT_EQUAL_STRING("VIOLET", buf);
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
