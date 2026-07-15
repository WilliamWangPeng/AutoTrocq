(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_066.
Record point_66 := mkPoint_66 { x_66 : nat; y_66 : nat }.

Definition to_pair_66 (p : point_66) : nat * nat := (x_66 p, y_66 p).
Definition from_pair_66 (q : nat * nat) : point_66 := mkPoint_66 (fst q) (snd q).
Definition weight_point_66 (p : point_66) : nat := x_66 p + y_66 p.
Definition weight_pair_66 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_66 : forall p : point_66, from_pair_66 (to_pair_66 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_66 : forall q : nat * nat, to_pair_66 (from_pair_66 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_66 : forall p : point_66, weight_pair_66 (to_pair_66 p) = weight_point_66 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_066.

