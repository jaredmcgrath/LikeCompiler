# Test Descriptions

## Modifications to Testing for Phase 4

We now have a functioning Like compiler. To enhance our test suite, we have revised the format of our expected output (`*.eOutput`) files to take advantage of this and demonstrate it's functionality.

All expected output files now have the following format:

```
### COMPILER WARNINGS ###
<compiler warnings, if there were any>
### START OF PROGRAM OUTPUT ###
<stdout from execution of compiled program (./program_name.out)>
### END OF PROGRAM OUTPUT ###
### START OF ASSEMBLY SOURCE ###
<x86 assembly source of compiled program (program_name.s)>
### END OF ASSEMBLY SOURCE ###
### START OF SSLTRACE ###
<ssltrace output>
### END OF SSLTRACE ###
```

Note that if there are no compiler warnings, the `### COMPILER WARNINGS ###` header will not be present in the output file.

This format allows us to verify:

- the computed output of a test program
- the validity of the generated x86 assembly, and
- the trace of the S/SL program during the compilation process, if needed

We have also left the compiled executable here alongside each of the expected output files. As usual, both of these can be generated with the `test-single.sh` script, supplying your own PT lib path or using ours (default), from which the outputs can be compared to our expected output.

IMPORTANT: Some tests require manual input.

- `Phase3Tests/7_stringsIO_positive.pt`: input `hello`
- `1-io_pos.pt`: input `1`, then `2`
- `5-stringsInputOutput_positive.pt`: input `hello`

Be sure to input these values as you see them here

## Previous Phase Tests

Some tests written from Phase 2 and 3 are relevant and necessary to test the fully functioning compiler as a result of Phase4. For this reason, we have modified the `test-phase.sh` and `generate-test-output.sh` scripts to execute all the tests located in `Phase2Tests/` and `Phase3Tests/` using the full compiler. The program source for each phase's respective tests will remain in their folders, `PhaseXTests/` where X is the phase number. However, our expected output will be located here in `Phase4Tests/phaseX_eOutput/`. This directory contains the full compiler output of the Phase 2 and 3 tests. Most importantly, a revised `testDescriptionsPhaseX.md` is located here to note any differences in test descriptions/expected output from Phase 2 and 3 (i.e. they are __NOT__ listed in this file).

_TL;DR_: Phase 2 and 3 tests are Phase 4 tests. They will be described in `Phase4Tests/testDescriptionsPhase2.md` and `Phase4Tests/testDescriptionsPhase3.md`. Their respective expected outputs are in `Phase4Tests/phas23_eOutput/` and `Phase4Tests/phase3_eOutput/`. Test program sources remain unmodified in `Phase2Tests/` and `Phase3Tests/`.

## Justification for Completeness

1. All language features that did not require changes in Phase 4 (boolean + integer constants and variables, if-elseif-else, expressions, I/O, null program, repeat + repeat while loops, routines and routines with parameters) were tested with simple positive test cases to ensure the correctness of the interface with the semantic phase. 

2. Mixed declarations and statements were tested by giving both variables and constants of varying types an initial value based on some expression/statement. The completeness of testing was ensured through previous phases, which ensure that initial values and variable declarations are working as expected. Testing of mixed declarations and statements was further tested implicitly through test cases made for proceeding steps.

3. Testing coverage of initial values was ensured by testing the assignment of an initial value of each possible type (`tStoreInteger`, `tStoreChar`, and `tStoreBoolean`). Note that an initial value of type boolean does not work because of a bug in the original PT Pascal implementation of the _oFixAndFreeShuntList_ rule. This will not be fixed.

4. Choose statement else clauses were tested by triggering the _trCaseAbort_ instruction and disobeying restrictions on case selector types in negative tests. Positive tests were used to ensure cases behaved as expected with single cases, multiple cases, and else statements included.

5. All types of string assignment, including variables, constants and arrays were tested using simple positive tests, with their outputs being printed. As well string input was also tested. Incorrect array bounds were tried and behaved as expected. 

6. Testing for string operations is ensured through 100% code coverage in the test suite. All lines of code that were added to implement the various string operations have one or more tests dedicated to ensuring proper functionality of code generated. See the individual test descriptions (those prefixed with `6-`) for details of which lines in `coder.ssl` the test program covers.

## Test Description Table

__Note__: All line numbers referenced in the following table are referring their respective test files.

<table>
<tr>
<th>File Name</th>
<th>Purpose</th>
<th>Function</th>
<th>Expected Output Filename</th>
<th>Notes</th>
</tr>

<tr>
<td>2-declarations_statements_pos.pt</td>
<td>Tests the behaviour when vars and vals are declared on the same line</td>
<td>Declares vals and vars</td>
<td>2-declarations_statements_pos.pt.eOutput</td>
<td>2</td>
</tr>

<tr>
<td>2-declarations_statements_pkgs_pos.pt</td>
<td>Tests the behaviour when a var is given an initial value of a public val inside a package</td>
<td>Declares a variable and gives initial value obtained from public member of package</td>
<td>2-declarations_statements_pkgs_pos.pt.eOutput</td>
<td>2</td>
</tr>

<tr>
<td>2-declarations_statements_condition_pos.pt</td>
<td>Tests the behaviour when a variable is assigned the result of a boolean condition</td>
<td>Declares and assigns variables to the result of boolean expression</td>
<td>2-declarations_statements_condition_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>2-declarations_statements_strOps_pos.pt</td>
<td>Tests behavior when variable is assigned the result of string operation</td>
<td>Declares two strings and sets variable to the result of boolean expression</td>
<td>2-declarations_statements_strOps_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>2-declarations_statements_public_pos.pt</td>
<td>Tests behavior of declaring multiple public vals on one line</td>
<td>Declares a series of public vals on the same line</td>
<td>2-declarations_statements_public_pos.pt.eOutput</td>
<td>2</td>
</tr>

<tr>
<td>4-choose-else_pos.pt</td>
<td>Ensure trCaseAbort not called and execution continues with else statement</td>
<td>Runs choose block with an else statement where the expression does not match any case selectors</td>
<td>4-choose-else_pos.pt.eOutput</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>4-choose-noelse_pos.pt</td>
<td>Ensure a single choose case can execute</td>
<td>Runs a choose statement with one case</td>
<td>4-choose-noelse_pos.pt.eOutput</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>4-choose-multi_pos.pt</td>
<td>Ensures multiple choose cases can execute</td>
<td>Runs choose block with multiple possible cases</td>
<td>4-choose-multi_pos.pt.eOutput</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>4-choose-nomatch_neg.pt</td>
<td>Ensure trCaseAbort is called</td>
<td>Runs choose block with no matching case selector and no else statement</td>
<td>4-choose-nomatch_neg.pt.eOutput</td>
<td>line 10: case selector does not match a label</td>
</tr>

<tr>
<td>4-choose-string_neg.pt</td>
<td>Ensure integer constant expr required in case selector</td>
<td>Runs choose block with constant strings as selectors</td>
<td>4-choose-string_neg.pt.eOutput</td>
<td>line 6: integer type expression req'd, line 7,10: integer constant required</td>
</tr>

<tr>
<td>1-constants_pos.pt</td>
<td>Test functionality of constant values</td>
<td>Makes some constants and prints them</td>
<td>1-constants_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-expressions_pos.pt</td>
<td>Test functionality of expressions evaluations</td>
<td>Makes some variables, assigns expressions to them, then prints them</td>
<td>1-expressions_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-if_pos.pt</td>
<td>Test functionality of if-else if-else statements</td>
<td>Assign value to a variable based on if blocks, then prints result</td>
<td>1-if_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-io_pos.pt</td>
<td>Test functionality of input (get, getln) and output (put, putln)</td>
<td>Prompts user for input, gets input, computes stuff, outputs result</td>
<td>1-io_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-null_program_pos.pt</td>
<td>Test functionality of null program</td>
<td>Just a null program</td>
<td>1-null_program_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-repeat_pos.pt</td>
<td>Test functionality of a repeat ... while loop</td>
<td>A repeat whiile loop that prints a loop variable</td>
<td>1-repeat_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-routines_params_pos.pt</td>
<td>Test functionality of a routine with paramaters</td>
<td>Defines a procedure that takes some paramaters and prints them. Calls said procedure</td>
<td>1-routines_params_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-routines_pos.pt</td>
<td>Test functionality of a basic procedure</td>
<td>Defines a procedure that prints a value. Calls said procedure</td>
<td>1-routines_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-variables_pos.pt</td>
<td>Test functionality of variables without initial values</td>
<td>Defines variables using like clause</td>
<td>1-variables_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>1-while_pos.pt</td>
<td>Test functionality repeat while ... loop</td>
<td>Runs a repeat while ... loop that prints a loop variable</td>
<td>1-while_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>3-init_val_bool_pos.pt</td>
<td>Test initial value of boolean (doesn't work, bug in PT Pascal)</td>
<td>Can't actually test initial value, so defines var then assigns bool to it</td>
<td>3-init_val_bool_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>3-init_val_int_pos.pt</td>
<td>Test initial value of integer</td>
<td>Define an variable with an initial value of an integer, prints it</td>
<td>3-init_val_int_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>3-init_val_string_pos.pt</td>
<td>Test initial value of string</td>
<td>Define an variable with an initial value of a string, prints it</td>
<td>3-init_val_string_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-all_ops.pt</td>
<td>Test all string operations in a larger program</td>
<td>Defines some functions to manipulate strings and their ord values</td>
<td>6-all_ops.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-chr_assign_pos.pt</td>
<td>Test chr() under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like 1, then assigns a chr of a string to it, then prints result</td>
<td>6-chr_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-chr_pos.pt</td>
<td>Test chr() under the OperandPushExpression rule</td>
<td>Defines var with initial value of chr, then prints result</td>
<td>6-chr_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-concat_assign_pos.pt</td>
<td>Test string concat under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like string, then assigns concat of strings to it, then prints result</td>
<td>6-concat_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-concat_pos.pt</td>
<td>Test string concat under the OperandPushExpression rule</td>
<td>Defines var with initial value of string concat, then prints result</td>
<td>6-concat_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-equal_assign_pos.pt</td>
<td>Test string equality under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines function that assigns string equality result to it, then if statement prints result</td>
<td>6-equal_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-equal_pos.pt</td>
<td>Test string equality under the OperandPushExpression rule</td>
<td>Defines function that checks string equality in if statement, prints result</td>
<td>6-equal_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-length_assign_pos.pt</td>
<td>Test string length under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like int, assigns string length to var, prints var</td>
<td>6-length_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-length_pos.pt</td>
<td>Test string length under the OperandPushExpression rule</td>
<td>Defines var with initial value of string length, prints var</td>
<td>6-length_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-not_equal_assign_pos.pt</td>
<td>Test string inequality under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines function that assigns string inequality result to it, then if statement prints result</td>
<td>6-not_equal_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-not_equal_pos.pt</td>
<td>Test string inequality under the OperandPushExpression rule</td>
<td>Defines function that checks string inequality in if statement, prints result</td>
<td>6-not_equal_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-ord_assign_pos.pt</td>
<td>Test ord() under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like string, then assigns ord of an integer to it, then prints result</td>
<td>6-ord_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-ord_pos.pt</td>
<td>Test ord() under the OperandPushExpression rule</td>
<td>Defines var with initial value of ord, then prints result</td>
<td>6-ord_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-repeat_assign_pos.pt</td>
<td>Test string repeat under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like string, assigns string repeat to var, prints var</td>
<td>6-repeat_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-repeat_pos.pt</td>
<td>Test string repeat under the OperandPushExpression rule</td>
<td>Defines var with initial value of string repeat, prints var</td>
<td>6-repeat_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-substring_assign_pos.pt</td>
<td>Test substring under the OperandPushExpressionAssignPopPop rule</td>
<td>Defines var like string, assigns substring to var, prints var</td>
<td>6-substring_assign_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-substring_pos.pt</td>
<td>Test substring under the OperandPushExpression rule</td>
<td>Defines var with initial value of substring, prints var</td>
<td>6-substring_pos.pt.eOutput</td>
<td></td>
</tr>

<tr>
<td>6-str_index_neg.pt</td>
<td>Test behaviour of substring with startIdx > endIdx</td>
<td>Defines substring var with startIdx > endIdx, prints result</td>
<td>6-str_index_neg.pt.eOutput</td>
<td>Generates code just fine, but behaviour is undefined</td>
</tr>

<tr>
<td>6-substring_neg.pt</td>
<td>Test substring behaviour with out-of-bounds indexes</td>
<td>Defines empty string, then take substring at index 1 to 1</td>
<td>6-substring_neg.pt.eOutput</td>
<td>Generates code jsut fine, but behaviour is undefined</td>
</tr>

<tr>
<td>5-stringsArr_negative</td>
<td>Testing improper subscripting of arrays</td>
<td>Assigns a string value to an out of bounds index</td>
<td>5-stringsArr_negative.pt.eOutput</td>
<td>Error occurs on line 5, out of bounds message can be seen in eOutput</td>
</tr>

<tr>
<td>5-stringsAssign_positive.pt</td>
<td>Testing string assignment </td>
<td>Assigns a string to constant and variable  and then assigns from a const to var</td>
<td>5-stringsAssign_positive.pt.eOutput</td>
<td>string
otherstring
string</td>
</tr>

<tr>
<td>5-stringsArr_positive.pt</td>
<td>Tests the string implementation of arrays</td>
<td>Assigns to arrays different string values</td>
<td>5-stringsArr_positive.pt.eOutput</td>
<td>testing
testing2
testing3
testing4000000000000 craziness</td>
</tr>

<tr>
<td>5-stringsArrAssign_positive.pt</td>
<td>Test assignment from one string array to another</td>
<td>Assigns from one string array to another</td>
<td>5-stringsArrAssign_positive.pt.eOutput</td>
<td>strteststr</td>
</tr>

<tr>
<td>5-stringsInputOutput_positive.pt</td>
<td>Test input and output for strings</td>
<td>Has user input a command, and then echoes it back to them</td>
<td>5-stringsInputOutput_positive.pt.eOutput</td>
<td>inputString
echoing:
inputString</td>
</tr>

</table>

