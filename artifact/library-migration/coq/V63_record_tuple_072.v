(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_072.
Record point_72 := mkPoint_72 { x_72 : nat; y_72 : nat }.

Definition to_pair_72 (p : point_72) : nat * nat := (x_72 p, y_72 p).
Definition from_pair_72 (q : nat * nat) : point_72 := mkPoint_72 (fst q) (snd q).
Definition weight_point_72 (p : point_72) : nat := x_72 p + y_72 p.
Definition weight_pair_72 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_72 : forall p : point_72, from_pair_72 (to_pair_72 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_72 : forall q : nat * nat, to_pair_72 (from_pair_72 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_72 : forall p : point_72, weight_pair_72 (to_pair_72 p) = weight_point_72 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_072.

