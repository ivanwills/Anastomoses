use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'Questions' }
BEGIN { use_ok 'Questions::Controller::Question' }

ok( request('/question')->is_success, 'Request should succeed' );
done_testing();
