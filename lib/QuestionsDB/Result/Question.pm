package QuestionsDB::Result::Question;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

QuestionsDB::Result::Question

=cut

__PACKAGE__->table("question");

=head1 ACCESSORS

=head2 question_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'question_question_id_seq'

=head2 question

  data_type: 'character varying'
  is_nullable: 0

=head2 category_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 question_description

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "question_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "question_question_id_seq",
  },
  "question",
  { data_type => "character varying", is_nullable => 0 },
  "category_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "question_description",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("question_id");
__PACKAGE__->add_unique_constraint("question_question_key", ["question"]);

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<QuestionsDB::Result::Category>

=cut

__PACKAGE__->belongs_to(
  "category",
  "QuestionsDB::Result::Category",
  { category_id => "category_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 question_answers

Type: has_many

Related object: L<QuestionsDB::Result::QuestionAnswer>

=cut

__PACKAGE__->has_many(
  "question_answers",
  "QuestionsDB::Result::QuestionAnswer",
  { "foreign.question_id" => "self.question_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-09-28 18:17:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7OkG7LHY0IHTQtXBqQRVrg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
