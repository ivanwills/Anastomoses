package QuestionsDB::Result::Answer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Answer

=cut

__PACKAGE__->table("answer");

=head1 ACCESSORS

=head2 answer_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'answer_answer_id_seq'

=head2 answer

  data_type: 'character varying'
  is_nullable: 0

=head2 answer_description

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "answer_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "answer_answer_id_seq",
  },
  "answer",
  { data_type => "character varying", is_nullable => 0 },
  "answer_description",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("answer_id");
__PACKAGE__->add_unique_constraint("answer_answer_key", ["answer"]);

=head1 RELATIONS

=head2 question_answers

Type: has_many

Related object: L<QuestionsDB::Result::QuestionAnswer>

=cut

__PACKAGE__->has_many(
  "question_answers",
  "QuestionsDB::Result::QuestionAnswer",
  { "foreign.answer_id" => "self.answer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-03 21:12:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kCHjL0S40oNSDI0vBSPbVw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
