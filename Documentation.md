# Phase 1 Documentation

## Keywords

Keywords [array, begin, case, const, div, do, mod, procedure, program, type, until] were removed and [choose, elseif, fun, is, like, pkg, public, using, val, when] were added. This was accomplished by editing the stdIdentifiers file in the parser subdirectory. Corresponding tokens were added/removed in scan.ssl as well (pChoose for the choose keyword).

Predefined identifiers were changed as well, [get, getln, put, putln] were added while [read, readln, write, writeln] were removed.

## Character Classes

Five new character classes were added to scan.ssl for the new Like inputs, and the existing lQuote class was changed to recognize double quotes rather than single. The following table describes the new Like inputs and their corresponding character class name. Character classes were added and altered in scan.ssl in the input declaration. 
<table>
<tr>
<th>Character</th>
<th>Character Class</th>
</tr>

<tr>
<td>"</td>
<td>lQuote</td>
</tr>

<tr>
<td>/</td>
<td>lSlash</td>
</tr>

<tr>
<td>%</td>
<td>lPercent</td>
</tr>

<tr>
<td>#</td>
<td>lHash</td>
</tr>

<tr>
<td>!</td>
<td>lBang</td>
</tr>

<tr>
<td>|</td>
<td>lBar</td>
</tr>
</table>

## Syntax Tokens
The following new Like symbols were added to `scan.ssl`:
<table>
<tr>
<th>Symbol</th>
<th>Syntax token</th>
</tr>

<tr>
<td>||</td>
<td>pDoubleOrBar</td>
</tr>

<tr>
<td>+=</td>
<td>pPlusEquals</td>
</tr>

<tr>
<td>-=</td>
<td>pMinusEquals</td>
</tr>

<tr>
<td>*=</td>
<td>pStarEquals</td>
</tr>

<tr>
<td>/=</td>
<td>pSlashEquals</td>
</tr>

<tr>
<td>%=</td>
<td>pPercentEquals</td>
</tr>

<tr>
<td>==</td>
<td>pDoubleEquals</td>
</tr>
</table>
Rules were added in order to emit these new syntax tokens when appropriate.
<br>
<br>

The initialization of the character class map was changed in the Initialize procedure of parser.pt. The map at indices corresponding to the ASCII codes of the new characters were initialized with the name of the character class using the 'ord' function. These changes allow the new characters to be pre-screened into character classes and further, scanned as legal tokens within the Like language. 

## Strings

Phase 1 string changes were implemented by changing the `quote` from `'` to `"` in `parser/parser.pt`

## Comments

The existing `Comment` and `AlternateComment` rules in `parser/scan.ssl` were removed. Two new rules, `SingleLineComment` and `MultiLineComment`, were added instead to discard

```like
// Single line comments, and

/*
 * multi-line comments
 */
```

The `Scan` rule was also adjusted to support these changes by first removing the old style `AlternateComment` and then by adding calls to the new comment rules for the `/` character.

# Phase 2 Documentation

## Packages

Packages were implemented by adding input choice of `'pkg'` to the `Block` rule in `parser.ssl`. This choice calls the new `Package` rule, which fully parses out any package based on the project specification, e.g.

```like
pkg package_name is
  // Package statements and declarations here
end;
```

Keyword identifier tokens were used to parse the package structure correctly, including `pIs`, `pEnd`, and `pSemicolon`.

## Choose

Choose statement was implemented by renaming `CaseStmt` rule to `ChooseStmt` rule and `CaseAlternative` rule to `ChooseAlternative` rule. In the `Block` rule, `'case'` was replaced with `'choose'`. The only notable change to the structure of `ChooseAlternative` was `Statement` became a `Block`. `ChoostStmt` was revised to reflect the changes in the syntax structure of case -> choose. The optional default `else` case was also added after `sCaseEnd` is emitted.

## Repeat While

TODO: Write this after finalizing the implementation

## Else-if

Else-if clauses were implemented by revising the `IfStmt` rule to recognize the 'elseif' token. No new semantic tokens were used - it was implemented to output a token stream equivalent to nested if statements. 

An `elseif`, `end` and default option were added to the selection block. `elseif` was added to recognize the new Like way of forming if statements. If the input token is an `elseif`, an `sElse` token is emitted, the `Block` rule is called, and the `IfStmt` rule is recursively called. This is similar to a nested if statement, with the `sElse` token representing the outer else enclosing an inner if that will be emitted by calling `IfStmt` recursively. The `Block` rule is called to emit the begin and end semantic tokens, to enclose the simulated if statement that will be parsed by the recursive call to `IfStmt` immediately after. This is shown below:

```
| 'elseif': %treat as nested if
  .sElse
  @Block %emits sBegin and sEnd
  @IfStmt %parse "inner if"

```

The `else` option was not changed as the emitted token, `sElse` remains the same in Like as in Pascal.

The `end` option was added to recognize the end of an if statement block. Within this option a semicolon is expected as the next input because Like includes semicolons as part of statements and declarations. Upon accepting a semicolon, the rule will exit as the if statement is concluded by the semicolon. This is shown below:

```
| 'end':
  ';'
  >
```

The default option was added to allow exiting of the recursive loop during recovery mode. Without this option, an incorrect if statement with no terminating `end` will run the loop in `IfStmt` infinitely.