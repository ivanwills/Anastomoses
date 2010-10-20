#!/usr/bin/perl

# Created on: 2010-10-17 19:48:37
# Create by:  Ivan Wills
# $Id$
# $Revision$, $HeadURL$, $Date$
# $Revision$, $Source$, $Date$

use strict;
use warnings;
use version;
use Scalar::Util;
use List::Util;
#use List::MoreUtils;
use Getopt::Long;
use Pod::Usage;
use Data::Dumper qw/Dumper/;
use English qw/ -no_match_vars /;
use FindBin qw/$Bin/;
use Path::Class;
use Text::CSV_XS;
use QuestionsDB;
use Questions::Helper;
use IO::Prompt;
use Memoize;

our $VERSION = version->new('0.0.1');
my ($name)   = $PROGRAM_NAME =~ m{^.*/(.*?)$}mxs;

my %option = (
    out     => undef,
    verbose => 0,
    man     => 0,
    help    => 0,
    VERSION => 0,
);

if ( !@ARGV ) {
    pod2usage( -verbose => 1 );
}

memoize('get_joint'  );
memoize('get_nerve'  );
memoize('get_movement');
memoize('get_region' );

main();
exit 0;

sub main {

    Getopt::Long::Configure('bundling');
    GetOptions(
        \%option,
        'import|i',
        'refresh|r',
        'all|a',
        'verbose|v+',
        'man',
        'help',
        'VERSION!',
    ) or pod2usage(2);
    #my $file = join ' ', @ARGV;

    if ( $option{'VERSION'} ) {
        print "$name Version = $VERSION\n";
        exit 1;
    }
    elsif ( $option{'man'} ) {
        pod2usage( -verbose => 2 );
    }
    elsif ( $option{'help'} ) {
        pod2usage( -verbose => 1 );
    }

    # do stuff here
    if ( $option{all} ) {
        $option{import}  = 1;
        $option{refresh} = 1;
    }

    my $db = QuestionsDB->connect('dbi:Pg:dbname=questions');

    if ($option{import}) {
        $db->txn_do( sub { import($db) } );
    }
    if ($option{refresh}) {
        $db->txn_do( sub { refresh($db) } );
    }

    return;
}

sub import {
    my ($db) = @_;

    my $csv  = Text::CSV_XS->new({ binary => 1 });
    my $dir  = file($0)->parent->parent->subdir('data');

    print "Muscles\n";
    my $file = $dir->file('muscles.csv');
    muscles($db, $csv, $file);

    print "Joints\n";
    $file = $dir->file('joints.csv');
    joints($db, $csv, $file);
}

sub muscles {
    my ($db, $csv, $file) = @_;

    die "'$file' does not exist!\n" if !-f $file;

    my $muscle_rs = $db->resultset('Muscle');
    my $muscle_movement_rs = $db->resultset('MuscleMovement');
    my $fh  = $file->openr;
    $csv->column_names( $csv->getline($fh) );

    my @known = qw/
        compartment
        muscle
        muscle_group
        origin
        insertion
        action
        joint
        innervation
        region
        subregion
    /;
    my %seen;

    MUSCLE:
    while ( my $line = $csv->getline_hr($fh) ) {
        my $new = {
            compartment  => lc $line->{compartment } || undef,
            muscle       => $line->{muscle      } ,
            muscle_group => $line->{muscle_group} ,
            origin       => $line->{origin      } ,
            insertion    => $line->{insertion   } ,
            action       => $line->{action      } ,
            joint_id     => get_joint   ($db, $line->{joint      }),
            nerve_id     => get_nerve   ($db, $line->{innervation}),
            region_id    => get_region  ($db, $line->{region     }, $line->{subregion}),
        };
        my $muscle = $muscle_rs->search({ muscle => $line->{muscle} });
        if ( !$muscle || !$muscle->first || !$muscle->first->muscle_id ) {
            $muscle = $muscle_rs->new($new);
            $muscle->insert();
        }
        else {
            $muscle = $muscle->first;
        }

        MOVEMENT:
        for my $movement ( keys %{$line} ) {
            next MOVEMENT if grep {$_ eq $movement} @known;
            next MOVEMENT if !$movement || $movement eq 1 ;
            next MOVEMENT if !$line->{$movement};
            if ( !$seen{$movement} ) {
                $seen{$movement}++;
                print "$movement\n";
            }

            my $movement_id  = get_movement($db, $movement);
            my $mm = $muscle_movement_rs->search({ movement_id => $movement_id, muscle_id => $muscle->muscle_id});
            next MOVEMENT if $mm && $mm->first;
            $mm = $muscle_movement_rs->new({ movement_id => $movement_id, muscle_id => $muscle->muscle_id });
            $mm->insert();
        }
    }
}

sub joints {
    my ($db, $csv, $file) = @_;

    die "'$file' does not exist!\n" if !-f $file;

    my $joint_rs = $db->resultset('Joint');
    my $joint_movement_rs = $db->resultset('JointMovement');
    my $fh  = $file->openr;
    $csv->column_names( $csv->getline($fh) );

    my @known = qw/
        joint_pk
        joint
        joint_class
        joint_type
    /;
    my %seen;

    JOINT:
    while ( my $line = $csv->getline_hr($fh) ) {
        my $new = {
            joint        => $line->{joint      } ,
            joint_class  => $line->{joint_class} ,
            joint_type   => $line->{joint_type } ,
        };
        my $joint = $joint_rs->search({ joint => $line->{joint} });
        if ( !$joint || !$joint->first || !$joint->first->joint_id ) {
            $joint = $joint_rs->new($new);
            $joint->insert();
        }
        else {
            $joint = $joint->first;
        }

        MOVEMENT:
        for my $movement ( keys %{$line} ) {
            next MOVEMENT if grep {$_ eq $movement} @known;
            next MOVEMENT if !$movement || $movement eq 1 ;
            next MOVEMENT if !$line->{$movement};
            if ( !$seen{$movement} ) {
                $seen{$movement}++;
                print "$movement\n";
            }

            my $movement_id  = get_movement($db, $movement);
            my $mm = $joint_movement_rs->search({ movement_id => $movement_id, joint_id => $joint->joint_id});
            next MOVEMENT if $mm && $mm->first;
            $mm = $joint_movement_rs->new({ movement_id => $movement_id, joint_id => $joint->joint_id });
            $mm->insert();
        }
    }
}

sub get_joint {
    my ($db, $value) = @_;

    my $joint_rs = $db->resultset('Joint');
    my $joint    = $joint_rs->search({joint => $value});

    return $joint->first->joint_id if $joint && $joint->first && $joint->first->joint_id;

    $joint = $joint_rs->new({joint => $value});
    $joint->insert();

    return $joint->joint_id;
}

sub get_nerve {
    my ($db, $value) = @_;

    my $nerve_rs = $db->resultset('Nerve');
    my $nerve    = $nerve_rs->search({nerve => $value});

    return $nerve->first->nerve_id if $nerve && $nerve->first && $nerve->first->nerve_id;

    $nerve = $nerve_rs->new({nerve => $value});
    $nerve->insert();

    return $nerve->nerve_id;
}

sub get_movement {
    my ($db, $value) = @_;

    my $movement_rs = $db->resultset('Movement');
    my $movement    = $movement_rs->search({movement => $value});

    return $movement->first->movement_id if $movement && $movement->first && $movement->first->movement_id;

    $movement = $movement_rs->new({movement => $value});
    $movement->insert();

    return $movement->movement_id;
}

sub get_region {
    my ($db, $parent_value, $subvalue) = @_;

    my $region_rs = $db->resultset('Region');
    my $region    = $region_rs->search({region => ucfirst $parent_value});

    if ( !$region || !$region->first ) {
        $region = $region_rs->new({region => ucfirst $parent_value});
        $region->insert;
    }
    else {
        $region = $region->first;
    }

    return $region->region_id if !$subvalue;

    my $subregion = $region_rs->search({region => ucfirst $subvalue, parent_region_id => $region->region_id});

    return $subregion->first->region_id if $subregion && $subregion->first && $subregion->first->region_id;

    $subregion = $subregion->new({region => ucfirst $subvalue, parent_region_id => $region->region_id});
    $subregion->insert();

    return $subregion->region_id;
}

sub refresh {
    my ($db) = @_;

    my $q_rs  = $db->resultset('Question');
    my $qa_rs = $db->resultset('QuestionAnswer');
    my $a_rs  = $db->resultset('Answer');
    my $tq_rs = $db->resultset('QuestionTemplate');
    my $csv   = Text::CSV_XS->new({ binary => 1 });
    my $file  = file($0)->parent->parent->subdir('data')->file('template.csv');

    my $fh  = $file->openr;
    $csv->column_names( $csv->getline($fh) );

    while ( my $line = $csv->getline_hr($fh) ) {
        next if !$line->{question_table} || !$line->{question_column} || !$line->{answer_table} || !$line->{answer_column};

        my $new = {
            question_template => $line->{question       } . '?',
            answer_template   => $line->{answer         },
            qtable            => $line->{question_table },
            qcolumn           => $line->{question_column},
            atable            => $line->{answer_table   },
            acolumn           => $line->{answer_column  },
        };
        my $template = $tq_rs->search({ question_template => $new->{question_template} });
        if ( $template && $template->first ) {
            $template = $template->first;

            # clear out old questions/answers
            $db->storage->dbh_do( sub {
                my ($storage, $dbh) = @_;
                $dbh->do(
                    "DELETE FROM question_answer\n" .
                    "   WHERE question_id IN (\n" .
                    "       SELECT question_id\n" .
                    "       FROM question\n" .
                    "       WHERE question_template_id = ?\n" .
                    "   )",
                    undef,
                    $template->question_template_id
                );
                $dbh->do(
                    "DELETE FROM question\n" .
                    "   WHERE question_template_id = ?",
                    undef,
                    $template->question_template_id
                );
                $dbh->do(
                    "DELETE FROM answer\n" .
                    "   WHERE answer_id NOT IN (\n" .
                    "       SELECT answer_id FROM question_answer\n" .
                    "   )",
                );
            });
        }
        else {
            $template = $tq_rs->new($new);
            $template->insert();
        }

        if ( $new->{qtable} eq $new->{atable} ) {
            my $table_rs = $db->resultset($new->{qtable});
            my $results = $table_rs->search();

            while ( my $row = $results->next ) {
                my $qcol  = $row->get_column($new->{qcolumn});
                my $acol  = $row->get_column($new->{acolumn});
                my $templ = $new->{question_template};
                my $ans   = $new->{answer_template  };
                my $path  = Question::Helper::get_path_from_region($db, $row->region_id, '/Human/Anatomy/');
                my $cat   = Question::Helper::get_category_from_path($db, $path, 1);
                $templ =~ s/%qcol%/$qcol/gxms;
                $templ =~ s/%acol%/$acol/gxms;
                $ans   =~ s/%qcol%/$qcol/gxms;
                $ans   =~ s/%acol%/$acol/gxms;
                print "Q: $templ\n";
                print "A: $ans\n";
                print "cat: $path ($cat)\n";

                my $question_id = Question::Helper::get_question($db, $templ, $cat);
                my $answer_id   = Question::Helper::get_answer($db, $ans);

                $db->svp_begin('qa');
                eval {
                    my $qa = $qa_rs->new({ question_id => $question_id, answer_id => $answer_id });
                    $qa->insert;
                };
                if ($EVAL_ERROR) {
                    $db->svp_rollback('qa');
                }
                else {
                    $db->svp_release('qa');
                }
            }
        }
    }
}

__DATA__

=head1 NAME

anatomy-import.pl - Imports the anatomy data CSVs creates the questions from the data

=head1 VERSION

This documentation refers to anatomy-import.pl version 0.1.

=head1 SYNOPSIS

   anatomy-import.pl [option]

 OPTIONS:
  -o --other         other option

  -v --verbose       Show more detailed option
     --version       Prints the version information
     --help          Prints this help information
     --man           Prints the full documentation for anatomy-import.pl

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

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2010 Ivan Wills (14 Mullion Close, Hornsby Heights, NSW Australia 2077).
All rights reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See L<perlartistic>.  This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut
