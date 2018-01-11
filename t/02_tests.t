use strict; # -*- mode: cperl -*-
use Test::More 0.98;

use lib '../lib'; # On site testing - JJ

use My::Test::Repo;

my $repo = new My::Test::Repo 'https://github.com/JJ/tests-python';
$repo->has_readme();

done_testing;
