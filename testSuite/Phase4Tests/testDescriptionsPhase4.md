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

## Previous Phase Tests

Some tests written from Phase 2 and 3 are relevant and necessary to test the fully functioning compiler as a result of Phase4. For this reason, we have modified the `test-phase.sh` and `generate-test-output.sh` scripts to execute all the tests located in `Phase2Tests/` and `Phase3Tests/` using the full compiler. The program source for each phase's respective tests will remain in their folders, `PhaseXTests/` where X is the phase number. However, our expected output will be located here in `Phase4Tests/phaseX_eOutput/`. This directory contains the full compiler output of the Phase 2 and 3 tests. Most importantly, a revised `testDescriptionsPhaseX.md` is located here to note any differences in test descriptions/expected output from Phase 2 and 3 (i.e. they are __NOT__ listed in this file).

_TL;DR_: Phase 2 and 3 tests are Phase 4 tests. They will be described in `Phase4Tests/testDescriptionsPhase2.md` and `Phase4Tests/testDescriptionsPhase3.md`. Their respective expected outputs are in `Phase4Tests/phas23_eOutput/` and `Phase4Tests/phase3_eOutput/`. Test program sources remain unmodified in `Phase2Tests/` and `Phase3Tests/`.

## Justification for Completeness

1. All language features that did not require changes in Phase 4 (boolean + integer constants and variables, if-elseif-else, expressions, I/O, null program, repeat + repeat while loops, routines and routines with parameters) were tested with simple positive test cases to ensure the correctness of the interface with the semantic phase. 

2. Mixed declarations and statements were tested by giving both variables and constants of varying types an initial value based on some expression/statement. The completeness of testing was ensured through previous phases, which ensure that initial values and variable declarations are working as expected. Testing of mixed declarations and statements was further tested implicitly through test cases made for proceeding steps.

3. 

4. Choose statement else clauses were tested by triggering the _trCaseAbort_ instruction and disobeying restrictions on case selector types in negative tests. Positive tests were used to ensure cases behaved as expected with single cases, multiple cases, and else statements included.

5. All types of string assignment, including variables, constants and arrays were tested using simple positive tests, with their outputs being printed. As well string input was also tested. Incorrect array bounds were tried and behaved as expected. 


TODO: Write step 3 tests after step 2 (pos + neg) and then write justification

Testing for string operations is ensured through 100% code coverage in the test suite. All lines of code that were added to implement the various string operations have one or more tests dedicated to ensuring proper functionality of code generated. See the individual test descriptions (those prefixed with `6-`) for details of which lines in `coder.ssl` the test program covers.

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
<td>Alex_7</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_8</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_9</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_10</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_11</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_12</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_13</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_14</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_15</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_16</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_17</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_18</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_19</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_20</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_21</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_22</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_23</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_24</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_25</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
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
<td>Nicole_6</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_7</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_8</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_9</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_10</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_11</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_12</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_13</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_14</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_15</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_16</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_17</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_18</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_19</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_20</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_21</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_22</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_23</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_24</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_25</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_1</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_2</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_3</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_4</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_5</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_6</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_7</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_8</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_9</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_10</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_11</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_12</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_13</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_14</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_15</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_16</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_17</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_18</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_19</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_20</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_21</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_22</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_23</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_24</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Jared_25</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
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

<tr>
<td>Travis_6</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_7</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_8</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_9</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_10</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_11</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_12</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_13</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_14</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_15</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_16</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_17</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_18</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_19</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_20</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_21</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_22</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_23</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_24</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_25</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

</table>

