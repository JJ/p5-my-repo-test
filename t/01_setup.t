use strict; # -*- mode: cperl -*-
use Test::More 0.98;

use lib '../lib'; # On site testing - JJ

use My::Test::Repo;

my $repo = new My::Test::Repo 'https://github.com/JJ/tests-python';
isa_ok( $repo, "My::Test::Repo");
my $new_repo = new My::Test::Repo 'https://github.com/JJ/tests-python';
isa_ok( $repo, "My::Test::Repo"); # No problem if it's created already
done_testing;
