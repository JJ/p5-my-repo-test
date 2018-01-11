package My::Test::Repo;
use v5.12;
use strict;
use warnings;

use version; our $VERSION = "0.0.1";

use base 'Test::Builder::Module'; # Included in Test::Simple
use Git;
use File::Slurper qw(read_text);

# Module implementation here
sub new {
  my $class = shift;
  my $url_repo = shift;
  my $tester = __PACKAGE__->builder;
  my ($user,$name) = ($url_repo=~ m{/([^/]+)/([^/]+)$});
  my $repo_dir = "/tmp/$user-$name";
  if (!(-e $repo_dir) or  !(-d $repo_dir) ) {
    mkdir($repo_dir);
    Git::command_oneline("clone $url_repo $repo_dir");
  }

  # Get README.md
  my $README;
  if ( -r "$repo_dir/README.md" ) {
    $README =  read_text( "$repo_dir/README.md");
  }
  my $self = { _url => $url_repo,	       
	       _t => $tester,
	       _readme => $README
	     };
  bless  $self, $class;
  return $self;
}

sub has_readme (){
  my $self = shift;
  return $self->{'_t'}->ok( $self->{'_readme'}, "Can haz README.md");
}

1;
__END__

=encoding utf-8

=head1 NAME

My::Test::Repo - Test repositories with assignments

=head1 SYNOPSIS

    use My::Test::Repo;

=head1 DESCRIPTION

My::Test::Repo is ...

=head1 INTERFACE

=head2 new $url

Instantiates a test class.

=head1 LICENSE

Copyright (C) JJ Merelo.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

JJ Merelo E<lt>jjmerelo@gmail.comE<gt>

=cut

