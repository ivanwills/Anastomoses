package Questions::Controller::Question;
use Moose;
use namespace::autoclean;
use Data::Dumper qw/Dumper/;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Questions::Controller::Question - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my @questions;

    my $qas       = $c->model('QuestionsDB')->resultset('QuestionAnswer');
    my $answers   = $c->model('QuestionsDB')->resultset('Answer');
    my $questions = $c->model('QuestionsDB')->resultset('Question')->search(
        { category_id => $c->request->params->{category_id} },
#        { join => 'QuestionAnswer' }
        { order_by => 'RANDOM()' },
    );

    while ( my $question = $questions->next ) {
        my $qa = $qas->search({ question_id => $question->question_id })->first;
        my $answer = $answers->search({ answer_id => $qa->answer_id })->first;
        push @questions, {
            question    => $question->question,
            question_id => $question->question_id,
            answer_id   => $answer->answer_id,
            answers     => [{
                answer    => $answer->answer,
                answer_id => $answer->answer_id,
            }],
        };
    }

    $c->stash->{questions} = \@questions;

    return;
}

=head1 AUTHOR

Ivan Wills,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
