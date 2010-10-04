package Questions::Controller::List;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Questions::Controller::List - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $categories = $c->model('QuestionsDB')->resultset('CategoryView');
    my %categories;
    my $current;
    $c->stash->{categories} = [];

    while ( my $category = $categories->next ) {
        push @{ $c->stash->{categories} }, $category;
    }

    #$c->stash->{template} = "list/index.html";

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
