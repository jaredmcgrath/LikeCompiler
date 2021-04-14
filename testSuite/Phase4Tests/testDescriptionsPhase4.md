# Test Descriptions

## Modifications to Testing for Phase 4

We now have a functioning Like compiler. To enhance our test suite, we have revised the format of our expected output (`*.eOutput`) files to take advantage of this and demonstrate it's functionality.

All expected output files now have the following format:

```
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

This format allows us to verify:

- the computed output of a test program
- the validity of the generated x86 assembly, and
- the trace of the S/SL program during the compilation process, if needed

We have also left the compiled executable here alongside each of the expected output files. As usual, both of these can be generated with the `test-single.sh` script, supplying your own PT lib path or using ours (default), from which the outputs can be compared to our expected output.

## Previous Phase Tests

## Justification for Completeness

All language features that did not require changes in Phase 4 (boolean + integer constants and variables, if-elseif-else, expressions, I/O, null program, repeat + repeat while loops, routines and routines with parameters) were tested with simple positive test cases to ensure the correctness of the interface with the semantic phase.

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
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>2-declarations_statements_neg.pt</td>
<td>Tests the behaviour when vals are declared on the same line with two val keywords</td>
<td>Declares two vals on the same line (keyword val written twice)</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>2-declarations_statements_pkgs_pos.pt</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>2-declarations_statements_condition_pos.pt</td>
<td>Tests the behaviour when a variable is assigned the result of a boolean condition</td>
<td>Declares and assigns variables to the result of boolean expression</td>
<td>2-declarations_statements_condition_pos.pt.eOutput</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_5</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Alex_6</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
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
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Nicole_5</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
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
<td>Travis_1</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_2</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_3</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_4</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
</tr>

<tr>
<td>Travis_5</td>
<td>Purpose</td>
<td>Function</td>
<td>Expected_Output_Filename</td>
<td>Notes_For_Neg_Tests</td>
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

