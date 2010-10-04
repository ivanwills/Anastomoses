package QuestionsDB::Result::CategoryView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::CategoryView

=cut

__PACKAGE__->table("category_view");

=head1 ACCESSORS

=head2 category_id

  data_type: 'integer'
  is_nullable: 1

=head2 category

  data_type: 'character varying'
  is_nullable: 1

=head2 parent_category_id

  data_type: 'integer'
  is_nullable: 1

=head2 question_count

  data_type: 'bigint'
  is_nullable: 1

=head2 depth

  data_type: 'integer'
  is_nullable: 1

=head2 path

  data_type: 'integer[]'
  is_nullable: 1

=head2 cycle

  data_type: 'boolean'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "category_id",
  { data_type => "integer", is_nullable => 1 },
  "category",
  { data_type => "character varying", is_nullable => 1 },
  "parent_category_id",
  { data_type => "integer", is_nullable => 1 },
  "question_count",
  { data_type => "bigint", is_nullable => 1 },
  "depth",
  { data_type => "integer", is_nullable => 1 },
  "path",
  { data_type => "integer[]", is_nullable => 1 },
  "cycle",
  { data_type => "boolean", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-03 21:12:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NhhLhvs0uWwEtzG8zTRcXw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
