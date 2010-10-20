package Question::Helper;

# Created on: 2010-10-20 17:00:39
# Create by:  Ivan Wills
# $Id$
# $Revision$, $HeadURL$, $Date$
# $Revision$, $Source$, $Date$

use Moose;
use version;
use Carp;
use Scalar::Util;
use List::Util;
#use List::MoreUtils;
use Data::Dumper qw/Dumper/;
use English qw/ -no_match_vars /;
use Memoize;


our $VERSION     = version->new('0.0.1');
our @EXPORT_OK   = qw//;
our %EXPORT_TAGS = ();
#our @EXPORT      = qw//;

memoize('get_category_from_path');
memoize('get_path_from_region');
memoize('get_question');
memoize('get_answer');

sub get_category_from_path {
    my ( $db, $path, $create ) = @_;
    my $catv_rs = $db->resultset('CategoryView');
    my $cat_rs  = $db->resultset('Category');

    my $cat = $catv_rs->search({ path => $path });

    return $cat->first->category_id if $cat && $cat->first;

    my @parts = split m{/}, $path;

    shift @parts if $parts[0] eq '';

    for my $i ( reverse 0 .. @parts - 2 ) {
        my $parent_path = '/' . join '/', @parts[ 0 .. $i ];
        my @left_over   = @parts[ $i + 1 .. @parts - 1 ];
        my $cat = $catv_rs->search({ path => $parent_path });

        if ( $cat && $cat->first ) {
            my $last_id = $cat->first->category_id;
            for my $part (@left_over) {
                my $new = {
                    category           => $part,
                    parent_category_id => $last_id,
                };
                my $cat = $cat_rs->new($new);
                $cat->insert();
                $last_id = $cat->category_id;
            }

            return $last_id;
        }
    }

    $cat = $cat_rs->new({ category => shift @parts });
    $cat->insert;
    my $last_id = $cat->category_id;
    while ( my $part = shift @parts ) {
        my $new = {
            category           => $part,
            parent_category_id => $last_id,
        };
        my $cat = $cat_rs->new($new);
        $cat->insert();
        $last_id = $cat->category_id;
    }

    return $last_id;
}

sub get_path_from_region {
    my ( $db, $region_id, $prefix ) = @_;
    $prefix ||= '/';
    my @parts;

    my $region_rs = $db->resultset('Region');
    my $region = $region_rs->find($region_id);

    while ( $region && $region->region_id ) {
        unshift @parts, $region->region;
        if ( $region->parent_region_id ) {
            $region = $region_rs->find($region->parent_region_id);
        }
        else {
            $region = undef;
        }
    }

    return $prefix . join '/', @parts;
}

sub get_question {
    my ( $db, $question, $category_id, $template_id ) = @_;

    my $q_rs = $db->resultset('Question');
    my $q = $q_rs->search({ question => $question, category_id => $category_id });

    return $q->first->question_id if $q && $q->first;

    $q = $q_rs->new({ question => $question, category_id => $category_id, question_template_id => $template_id });
    $q->insert;

    return $q->question_id;
}

sub get_answer {
    my ( $db, $answer ) = @_;

    my $q_rs = $db->resultset('Answer');
    my $q = $q_rs->search({ answer => $answer });

    return $q->first->answer_id if $q && $q->first;

    $q = $q_rs->new({ answer => $answer });
    $q->insert;

    return $q->answer_id;
}

1;

__END__

=head1 NAME

Question::Helper - <One-line description of module's purpose>

=head1 VERSION

This documentation refers to Question::Helper version 0.1.


=head1 SYNOPSIS

   use Question::Helper;

   # Brief but working code example(s) here showing the most common usage(s)
   # This section will be as far as many users bother reading, so make it as
   # educational and exemplary as possible.


=head1 DESCRIPTION

A full description of the module and its features.

May include numerous subsections (i.e., =head2, =head3, etc.).


=head1 SUBROUTINES/METHODS

A separate section listing the public components of the module's interface.

These normally consist of either subroutines that may be exported, or methods
that may be called on objects belonging to the classes that the module
provides.

Name the section accordingly.

In an object-oriented module, this section should begin with a sentence (of the
form "An object of this class represents ...") to give the reader a high-level
context to help them understand the methods that are subsequently described.




=head1 DIAGNOSTICS

A list of every error and warning message that the module can generate (even
the ones that will "never happen"), with a full explanation of each problem,
one or more likely causes, and any suggested remedies.

=head1 CONFIGURATION AND ENVIRONMENT

A full explanation of any configuration system(s) used by the module, including
the names and locations of any configuration files, and the meaning of any
environment variables or properties that can be set. These descriptions must
also include details of any configuration language used.

=head1 DEPENDENCIES

A list of all of the other modules that this module relies upon, including any
restrictions on versions, and an indication of whether these required modules
are part of the standard Perl distribution, part of the module's distribution,
or must be installed separately.

=head1 INCOMPATIBILITIES

A list of any modules that this module cannot be used in conjunction with.
This may be due to name conflicts in the interface, or competition for system
or program resources, or due to internal limitations of Perl (for example, many
modules that use source code filters are mutually incompatible).

=head1 BUGS AND LIMITATIONS

A list of known problems with the module, together with some indication of
whether they are likely to be fixed in an upcoming release.

Also, a list of restrictions on the features the module does provide: data types
that cannot be handled, performance issues and the circumstances in which they
may arise, practical limitations on the size of data sets, special cases that
are not (yet) handled, etc.

The initial template usually just has:

There are no known bugs in this module.

Please report problems to Ivan Wills (ivan.wills@gmail.com).

Patches are welcome.

=head1 AUTHOR

Ivan Wills - (ivan.wills@gmail.com)
<Author name(s)>  (<contact address>)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2010 Ivan Wills (14 Mullion Close, Hornsby Heights, NSW Australia 2077).
All rights reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See L<perlartistic>.  This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut
