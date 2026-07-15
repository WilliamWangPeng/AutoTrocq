(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_058.
Record point_58 := mkPoint_58 { x_58 : nat; y_58 : nat }.

Definition to_pair_58 (p : point_58) : nat * nat := (x_58 p, y_58 p).
Definition from_pair_58 (q : nat * nat) : point_58 := mkPoint_58 (fst q) (snd q).
Definition weight_point_58 (p : point_58) : nat := x_58 p + y_58 p.
Definition weight_pair_58 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_58 : forall p : point_58, from_pair_58 (to_pair_58 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_58 : forall q : nat * nat, to_pair_58 (from_pair_58 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_58 : forall p : point_58, weight_pair_58 (to_pair_58 p) = weight_point_58 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_058.

