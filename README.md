# Exercism Research: Experiment 1 Track

[![Build Status](https://travis-ci.org/exercism/research_experiment_1.svg?branch=master)][travis-badge]

This is a language track which holds the exercises for Exercism Research's first experiment.

## Exercises

All exercises in this track will be bonus exercises. This means that their `core` property will be set to `false` and the `unlocked_by` property set to `null` in the [`config.json` file][config-json-file]. Here's an [example exercise entry][config-json-exercise].

Each exercise must use the following naming format: `<track>-[1|2]-[a|b]`. The number part indicates which part of the exercise it represents (first part is start from scratch; second part is start with existing code). The letter part indicates which of the two exercises it is (remember: each track should have two exercises).

Each exercise in this repository must be unique, so copying exercises from another language is not an option.

These are examples of valid exercise names:

- `csharp-1-a` : first part of exercise A for C#.
- `javascript-2-b` : second part of exercise B for JavaScript.
- `ruby-1-b` : first part of exercise B for Ruby.

### Test messages

Solving exercises that are part of the experiment is different from the regular website's process in two ways:

1. Exercises are solved exclusively using in-browser coding.
1. The test suite used to test the code is not available to the user.

This means that when the code does _not_ pass one of the tests, the user won't see the code of the test that failed or the input the code was called with. To fix this, we need to provide a bit of context when we show errors to the user.

For an equality assertion failure, the error with context might look as follows:

> We tried running `MyTests.MyTestMethod(1)` but got the following error:
>
> ```
> Expected: "foobar"
>   Actual: "barfood"
> ```

To achieve this, each exercise should define a `.meta/test_messages.json` file. This file is a mapping of the test method's name (the `"name"` value in the [test runner output][test-runner-output-format]) to the message displayed when the test fails:

```json
{
  "MyTestMethod": {
    "msg": "We tried running `MyTests.MyTestMethod(1)` but got the following error:\n\n%{output}"
  }
}
```

Note that you can embed the [test runner's][test-runner-output-format] output (usually the assertion error message) in the message by using `%{output}`.

As most test messages will be equal except for the called method, there is a shorthand notation that only requires the variable part (the method/command being called) to be specified:

```json
{
  "MyTestMethod": {
    "cmd": "MyTests.MyTestMethod(1)"
  }
}
```

This definition is functionally equivalent to the explicit version that specified the full message.

### Stub files

Each exercise should have a stub file that provides the minimal amount of code to help the user get started. If the user submits the stub file without modifications, the resulting error message should explain precisely what is expected of the user.

For example consider the following C# stub:

```csharp
public static string MyTestMethod(int i)
{
    throw new System.NotImplementedException("Please implement the MyTests.MyTestMethod method");
}
```

If the user would submit this code, the C# test runner output's would be:

> We tried running `MyTests.MyTestMethod(1)` but got the following error:
>
> ```
> Please implement the MyTests.MyTestMethod method
> ```

Note that we opted for using an exception instead of a compile error, as we can control the exception message but not the compiler message.

### Examples

The [`csharp-1-a`][exercise-csharp-1-a] and [`csharp-1-b`][exercise-csharp-1-b] exercises are working examples of exercises.

[exercise-csharp-1-a]: https://github.com/exercism/research_experiment_1/tree/master/exercises/csharp-1-a
[exercise-csharp-1-b]: https://github.com/exercism/research_experiment_1/tree/master/exercises/csharp-1-b
[test-runner-output-format]: https://github.com/exercism/automated-tests/blob/master/docs/interface.md#output-format
[travis-badge]: https://travis-ci.org/exercism/research_experiment_1
[config-json-file]: https://github.com/exercism/research_experiment_1/blob/master/config.json
[config-json-exercise]: https://github.com/exercism/research_experiment_1/blob/master/config.json#L10
