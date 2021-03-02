# Like Compiler Test Suite

This contains all our tests for each phase, both positive and negative cases, grouped by the phase in which they were written.

## To run all tests for all phases (`test.sh`)
1. Ensure you are in the `testSuite/` directory
2. Run `./test.sh`

This will run the `test-phaseX.sh` script in each of the phase directories. See below for an explaination of the single phase test script

## To run all tests for a single phase (`test-phaseX.sh`)

1. Navigate to the directory for a given phase (e.g. `cd Phase2Tests`)
2. Run `./test-phaseX.sh`, replacing `X` with the appropriate phase number (e.g. `./test-phase2.sh`)

This script will, for each `*.pt` file, run the appropriate `ssltrace` command, and then dump the generated `*.eOutput` into the `pX_out` directory. Then, `diff` is used to compare the generated `*.eOutput` to the expected output listed alongside each test program in `PhaseXTests/`.

Output is generally formatted as some headers, followed by a number of ptc copyright statments (one for each program being compiled), followed by the output from diff. 

The diff output should be interpreted as follows:

- Program name is displayed followed by the diff output
- The following lines display the differences between expected output (lines prefixed with `<`) and actual output (lines prefixed with `>`)
- If there are no such lines following the program name, then expected output matched actual output exactly
- If there are no differences following _any_ program names, then all tests have passed successfully

**If you intend to use a different library for ptc/ssltrace**, (that is, not the library provided by our source code in `src/lib/pt/`) supply the `-L` flag followed by the (relative or absolute) path to your `lib/pt`. E.g. `./test-phase2.sh -L ../../src/lib/pt`

## To run a single test file (`test-single.sh`)

1. Navigate to the directory for a given phase (e.g. `cd Phase2Tests`)
2. Run `./test-single.sh`

This supports the following flags:

<table>
  <tr>
    <th>Flag</th>
    <th>Value</th>
    <th>Example</th>
  </tr>
  <tr>
    <td>-f</td>
    <td>Path to test program file</td>
    <td><code>./test-single.sh -f choose_positive.pt</code></td>
  </tr>
  <tr>
    <td>-L</td>
    <td>Path to ptc library</td>
    <td><code>./test-single.sh -L "../../src/lib/pt"</code></td>
  </tr>
  <tr>
    <td>-s</td>
    <td>Save output as expected output? (yes or no)</td>
    <td><code>./test-single.sh -s yes</code></td>
  </tr>
  <tr>
    <td>-c</td>
    <td>Compare output to expected output? (yes or no)</td>
    <td><code>./test-single.sh -c yes</code></td>
  </tr>
</table>

This script will run the appropriate `ssltrace` command on the test program provided and save generated output in the `pX_out/` directory. Optionally saves generated output as expected output (CAUTION: overwrites existing). Optionally compares generated output to expected output. Comparison output should be interpretted as described above in 'Run all tests for a single phase' section

For all flags except the library flag (`-L`), user will be prompted for a response if flag not supplied in arguments. 

Library defaults to `../../src/lib/pt`
