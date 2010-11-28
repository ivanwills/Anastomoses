package QuestionsDB::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Category

=cut

__PACKAGE__->table("category");

=head1 ACCESSORS

=head2 category_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'category_category_id_seq'

=head2 category

  data_type: 'character varying'
  is_nullable: 0

=head2 parent_category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "category_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "category_category_id_seq",
  },
  "category",
  { data_type => "character varying", is_nullable => 0 },
  "parent_category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("category_id");
__PACKAGE__->add_unique_constraint("category_category_key", ["category", "parent_category_id"]);

=head1 RELATIONS

=head2 parent_category

Type: belongs_to

Related object: L<QuestionsDB::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "parent_category",
  "QuestionsDB::Result::Category",
  { category_id => "parent_category_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 categories

Type: has_many

Related object: L<QuestionsDB::Result::Category>

=cut

__PACKAGE__->has_many(
  "categories",
  "QuestionsDB::Result::Category",
  { "foreign.parent_category_id" => "self.category_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 questions

Type: has_many

Related object: L<QuestionsDB::Result::Question>

=cut

__PACKAGE__->has_many(
  "questions",
  "QuestionsDB::Result::Question",
  { "foreign.category_id" => "self.category_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-11-29 06:06:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xpsf6ivaHHLKo3b+akarvw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
