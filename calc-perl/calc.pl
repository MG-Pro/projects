#!/usr/bin/perl

my $request = $ENV{'QUERY_STRING'};

my @params = split(/&/, $request);
my $n_par = @params;
my $result;

my @values;

for (my $i = 0; $i < $n_par; $i++) {
    my ($name, $value) = split(/=/, $params[$i]);
    push(@values, $value)
}

if (@values[1] eq "add") {
    $result = @values[0] + @values[2]
}
elsif (@values[1] eq "sub") {
    $result = @values[0] - @values[2]
}
elsif (@values[1] eq "mult") {
    $result = @values[0] * @values[2]
}
elsif (@values[1] eq "div") {
    $result = @values[0] / @values[2]
}

print <<HTML;
Content-type: text/html\n\n

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
</head>
<body>
HTML
print "<h1>Результат: ", $result, "</H1>";
print <<HTML;
</body>
</html>
HTML

