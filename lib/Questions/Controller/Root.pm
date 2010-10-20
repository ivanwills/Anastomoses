package Questions::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Questions::Controller::Root - Root Controller for Questions

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->redirect($c->uri_for('/list'));
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

    # Don't render if someone gave us body.
    return if $c->response->body || $c->response->status != 200;

    # No point populating data if we're just going to do a redirect
    if ( !$c->response->redirect ) {

        if (($c->request->header('Accept') &&
             $c->request->header('Accept') =~ /application\/json/io)
                ||
            ($c->request->param('output') &&
             lc($c->request->param('output')) eq 'json')) {

            my $callback;
            if ( $c->request->param('callback')
                && $c->request->param('callback') =~ /^[a-z0-9_]+$/ois
            ) {
                $callback = $c->request->param('callback');
            }

            $c->detach('Questions::View::JSON', [ $callback ]);
            return;
        }

        return $c->forward('Questions::View::TT');
    }

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
