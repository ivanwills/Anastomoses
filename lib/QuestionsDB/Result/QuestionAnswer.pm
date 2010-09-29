package QuestionsDB::Result::QuestionAnswer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

QuestionsDB::Result::QuestionAnswer

=cut

__PACKAGE__->table("question_answer");

=head1 ACCESSORS

=head2 question_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 answer_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 question_answer_description

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "question_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "answer_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "question_answer_description",
  { data_type => "character varying", is_nullable => 1 },
);

=head1 RELATIONS

=head2 question

Type: belongs_to

Related object: L<QuestionsDB::Result::Question>

=cut

__PACKAGE__->belongs_to(
  "question",
  "QuestionsDB::Result::Question",
  { question_id => "question_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 answer

Type: belongs_to

Related object: L<QuestionsDB::Result::Answer>

=cut

__PACKAGE__->belongs_to(
  "answer",
  "QuestionsDB::Result::Answer",
  { answer_id => "answer_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-09-28 18:17:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ExSei38Q3NbG+OagnoMAhQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
