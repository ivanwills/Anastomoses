package Questions::Controller::Question;
use Moose;
use namespace::autoclean;
use Data::Dumper qw/Dumper/;
use List::Util qw/shuffle/;

BEGIN {extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $cat = $c->model('QuestionsDB')->resultset('Category')->find($c->request->params->{category_id});

    $c->stash->{category}  = $cat->category;
    $c->stash->{questions} = $self->create_questions($c, $c->request->params->{category_id} );
    $c->stash->{question_count} = scalar @{ $c->stash->{questions} };

    return;
}

sub create_questions {
    my ( $self, $c, $category_id ) = @_;
    my @questions;

    return $c->session->{questions} if $c->session->{category_id} && $category_id == $c->session->{category_id};

    my $qav       = $c->model('QuestionsDB')->resultset('QuestionAnswerView');
    my $questions = $qav->search(
        { category_id => $category_id },
        { order_by => 'RANDOM()' },
    );

    while ( my $question = $questions->next ) {
        push @questions, {
            question    => $question->question,
            question_id => $question->question_id,
            answer_id   => $question->answer_id,
            answers     => [{
                answer    => $question->answer,
                answer_id => $question->answer_id,
            }],
        };

        my $other = $qav->search(
            {
                category_id => $category_id,
                question_id => { '!=' => $question->question_id },
                answer      => { '!=' => $question->answer },
            },
            {
                order_by => 'RANDOM()',
            },
        );

        for ( 0 .. 3 ) {
            my $answer = $other->next;
            push @{ $questions[-1]{answers} }, {
                answer    => $answer->answer,
                answer_id => $answer->answer_id,
            };
        }

        @{ $questions[-1]{answers} } = shuffle @{ $questions[-1]{answers} };
    }

    $c->session->{category_id} = $category_id;
    return $c->session->{questions} = \@questions;
}

__PACKAGE__->meta->make_immutable;

1;

__DATA__

=head1 NAME

Questions::Controller::Question - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=head2 index

=head1 AUTHOR

Ivan Wills,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
